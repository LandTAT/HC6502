#include "stm32f10x.h"
#include "ctype.h"
#include "string.h"
#include "video.h"
#include "gdi.h"
#include "zqueue.h"
#include "hc6502_display.h"

static void GPIO_Configuration(void);
static void EXTI_Configuration(void);
void reset_state(void);
void buff_fill(uint8_t ch);
void tabs(void);
void line_feed(void);
void refresh(void);
void set_cursor(uint8_t x);

uint8_t char_buf[CHAR_ROW][CHAR_COL + 1];
uint16_t first_line;
uint16_t cursor_row, cursor_col;
void (*requ_para_func)(uint8_t);
//bool refresh_flag = true;
zqueue message;

void hc6502_display_init()
{
	zq_init(&message);
	GPIO_Configuration();
	EXTI_Configuration();
	vidInit();
	reset_state();
	buff_fill(' ');
}

void hc6502_display_routine(void)
{
	while(!zq_empty(&message)){
		uint8_t ch = zq_dequeue(&message);
		if(requ_para_func == NULL){
			if(isprint(ch)){
				if(cursor_col >= CHAR_COL)
					line_feed();
				char_buf[cursor_row][cursor_col] = ch;
				++cursor_col;
			}
			else{
				switch(ch){
					case '\t':
						tabs();
						break;
					case '\n':
						line_feed();
						break;
					case CMD_CLEAR:
						reset_state();
						buff_fill(' ');
						break;
					case CMD_FILL:
						reset_state();
						buff_fill(0x7F);
						break;
					case CMD_SETCUR:
						set_cursor(ch);
						break;
					default:
						//Illegal instruction
						break;
				}
			}
		}
		else{
			(*requ_para_func)(ch);
		}
	}
	refresh();
}

void refresh(void)
{
	for(uint16_t i = 0; i < CHAR_ROW; ++i){
		uint16_t j = (first_line + i) % CHAR_ROW;
		gdiDrawTextEx(0, PIXEL_PER_ROW * i, char_buf[j], GDI_ROP_COPY);
	}
}

void set_cursor(uint8_t x)
{
	static uint8_t cnt;
	static uint8_t new_row;
	if(x == CMD_SETCUR){
		cnt = 0;
		requ_para_func = set_cursor;
	}
	else{
		if(cnt < 1){
			new_row = x;
			++cnt;
		}
		else{
			cursor_col = new_row % CHAR_COL;
			cursor_row = (first_line + x) % CHAR_ROW;
			requ_para_func = NULL;
		}
	}
}

void tabs(void)
{
	uint16_t space = TAB_LEN - cursor_col % TAB_LEN;
	for(uint16_t i = 0; i < space; ++i){
		if(cursor_col >= CHAR_COL){
			line_feed();
			break;
		}
		char_buf[cursor_row][cursor_col] = ' ';
		++cursor_col;
	}
}

void line_feed(void)
{
	cursor_col = 0;
	cursor_row = (cursor_row + 1) % CHAR_ROW;
	if(cursor_row == first_line){
		memset(char_buf + cursor_row, ' ', CHAR_COL);
		char_buf[cursor_row][CHAR_COL] = '\0';
		first_line = (first_line + 1) % CHAR_ROW;
	}
}

void reset_state(void)
{
	first_line = 0;
	cursor_row = 0;
	cursor_col = 0;
	requ_para_func = NULL;
}

void buff_fill(uint8_t ch)
{
	for(uint16_t i = 0; i < CHAR_ROW; ++i){
		memset(char_buf + i, ch, CHAR_COL);
		char_buf[i][CHAR_COL] = '\0';
	}
}

void EXTI9_5_IRQHandler(void)
{
	if(EXTI_GetITStatus(EXTI_Line6) != RESET)
	{
    if(GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_6)){
			if(!zq_full(&message)){
				uint8_t data = 0;
				data |= GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_15);
				data <<= 1;
				data |= GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_14);
				data <<= 1;
				data |= GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_13);
				data <<= 1;
				data |= GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_11);
				data <<= 1;
				data |= GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_10);
				data <<= 1;
				data |= GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_8);
				data <<= 1;
				data |= GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_4);
				data <<= 1;
				data |= GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_3);
				zq_enqueue(&message, data);
			}
			else{
				//Queue is full!!!
				GPIO_WriteBit(GPIOA, GPIO_Pin_11, Bit_SET);
			}
			GPIO_WriteBit(GPIOA, GPIO_Pin_15, Bit_SET);
		}
		else
			GPIO_WriteBit(GPIOA, GPIO_Pin_15, Bit_RESET);
    EXTI_ClearITPendingBit(EXTI_Line6);
  }
}

void GPIO_Configuration(void)
{
	GPIO_InitTypeDef GPIO_InitStructure;
	
	GPIO_PinRemapConfig(GPIO_Remap_SWJ_JTAGDisable, ENABLE);
	
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
	GPIO_InitStructure.GPIO_Pin  = GPIO_Pin_15;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_Init(GPIOA, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_3 | GPIO_Pin_4 | GPIO_Pin_8 | GPIO_Pin_10 | GPIO_Pin_11 | GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPD;
	GPIO_Init(GPIOB, &GPIO_InitStructure);
	
	GPIO_WriteBit(GPIOA, GPIO_Pin_15, Bit_RESET);
}

void EXTI_Configuration(void)
{
	GPIO_InitTypeDef GPIO_InitStructure; 
	EXTI_InitTypeDef EXTI_InitStructure;
	NVIC_InitTypeDef NVIC_InitStructure;
	
  /* 配置NVIC为优先级组1 */
  //NVIC_PriorityGroupConfig(NVIC_PriorityGroup_1);
  /* 配置中断源：按键1 */
  NVIC_InitStructure.NVIC_IRQChannel = EXTI9_5_IRQn;
  /* 配置抢占优先级 */
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 2;
  /* 配置子优先级 */
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
  /* 使能中断通道 */
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
	
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPD;		//GPIO_Mode_IN_FLOATING
  GPIO_Init(GPIOB, &GPIO_InitStructure);

	/* 选择EXTI的信号源 */
  GPIO_EXTILineConfig(GPIO_PortSourceGPIOB, GPIO_PinSource6); 
	
  EXTI_InitStructure.EXTI_Line = EXTI_Line6;
  EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
  EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising_Falling;
  EXTI_InitStructure.EXTI_LineCmd = ENABLE;
  EXTI_Init(&EXTI_InitStructure);
}
