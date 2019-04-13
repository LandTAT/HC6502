;
; File generated by cc65 v 2.17 - Git e1e5cd9
;
	.fopt		compiler,"cc65 v 2.17 - Git e1e5cd9"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.import		_vsnprintf
	.export		_uart_init
	.export		_uart_getc
	.export		_uart_putc
	.export		_uart_puts
	.export		_uart_printf
	.export		_uart_handler
	.import		_shell
	.export		_urb_index
	.export		_uart_recv_buf

.segment	"RODATA"

L0071:
	.byte	$63,$6D,$64,$20,$74,$6F,$6F,$20,$6C,$6F,$6E,$67,$21,$0A,$00

.segment	"BSS"

_urb_index:
	.res	2,$00
_uart_recv_buf:
	.res	512,$00

; ---------------------------------------------------------------
; int __near__ uart_init (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_uart_init: near

.segment	"CODE"

	jsr     decsp1
	lda     #$0B
	ldy     #$00
	sta     (sp),y
	sta     $7F02
	lda     #$1E
	sta     (sp),y
	sta     $7F03
	ldx     #$00
	txa
	jmp     incsp1

.endproc

; ---------------------------------------------------------------
; unsigned char __near__ uart_getc (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_uart_getc: near

.segment	"CODE"

	jsr     decsp2
L0085:	lda     $7F01
	ldy     #$00
	sta     (sp),y
	and     #$08
	beq     L0085
	lda     $7F00
	iny
	sta     (sp),y
	ldx     #$00
	lda     (sp),y
	jmp     incsp2

.endproc

; ---------------------------------------------------------------
; void __near__ uart_putc (unsigned char)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_uart_putc: near

.segment	"CODE"

	jsr     decsp1
L0087:	lda     $7F01
	ldy     #$00
	sta     (sp),y
	and     #$10
	beq     L0087
	iny
	lda     (sp),y
	sta     $7F00
	jmp     incsp2

.endproc

; ---------------------------------------------------------------
; void __near__ uart_puts (__near__ unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_uart_puts: near

.segment	"CODE"

	jsr     decsp2
	ldx     #$00
	txa
L0089:	jsr     stax0sp
	clc
	ldy     #$02
	adc     (sp),y
	sta     ptr1
	txa
	iny
	adc     (sp),y
	sta     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	beq     L0044
	jsr     ldax0sp
	clc
	ldy     #$02
	adc     (sp),y
	sta     ptr1
	txa
	iny
	adc     (sp),y
	sta     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	jsr     pusha
	jsr     _uart_putc
	jsr     ldax0sp
	jsr     incax1
	jmp     L0089
L0044:	jmp     incsp4

.endproc

; ---------------------------------------------------------------
; int __near__ uart_printf (__near__ const unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_uart_printf: near

.segment	"DATA"

L0052:
	.byte	$00
	.res	255,$00

.segment	"CODE"

	jsr     enter
	jsr     decsp6
	ldy     #$06
	lda     (sp),y
	jsr     leaa0sp
	jsr     incax5
	jsr     stax0sp
	lda     #<(L0052)
	ldx     #>(L0052)
	jsr     pushax
	ldx     #$01
	lda     #$00
	jsr     pushax
	ldy     #$0A
	lda     (sp),y
	jsr     leaa0sp
	dey
	jsr     incaxy
	jsr     pushw
	ldy     #$07
	jsr     ldaxysp
	jsr     _vsnprintf
	jsr     axlong
	ldy     #$02
	jsr     steaxysp
	lda     #<(L0052)
	ldx     #>(L0052)
	jsr     pushax
	jsr     _uart_puts
	ldy     #$03
	jsr     ldaxysp
	ldy     #$06
	jmp     leavey

.endproc

; ---------------------------------------------------------------
; void __near__ uart_handler (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_uart_handler: near

.segment	"CODE"

	jsr     decsp1
	jsr     _uart_getc
	ldy     #$00
	sta     (sp),y
	cmp     #$0A
	bne     L008E
	jmp     incsp1
L008E:	lda     _urb_index+1
	cmp     #$01
	bne     L008D
	lda     _urb_index
	cmp     #$FF
	bne     L008D
	lda     (sp),y
	cmp     #$0D
	beq     L008D
	lda     #<(L0071)
	ldx     #>(L0071)
	jsr     pushax
	jsr     _uart_puts
	lda     #$00
	sta     _urb_index
	sta     _urb_index+1
	jmp     incsp1
L008D:	lda     (sp),y
	cmp     #$0D
	bne     L0075
	lda     #<(_uart_recv_buf)
	clc
	adc     _urb_index
	sta     ptr1
	lda     #>(_uart_recv_buf)
	adc     _urb_index+1
	sta     ptr1+1
	tya
	sta     (ptr1),y
	lda     #<(_uart_recv_buf)
	ldx     #>(_uart_recv_buf)
	jsr     pushax
	jsr     _shell
	lda     #$00
	sta     _urb_index
	sta     _urb_index+1
	jmp     incsp1
L0075:	lda     #<(_uart_recv_buf)
	clc
	adc     _urb_index
	sta     ptr1
	lda     #>(_uart_recv_buf)
	adc     _urb_index+1
	sta     ptr1+1
	lda     (sp),y
	sta     (ptr1),y
	lda     _urb_index
	ldx     _urb_index+1
	jsr     incax1
	sta     _urb_index
	stx     _urb_index+1
	lda     (sp),y
	jsr     pusha
	jsr     _uart_putc
	jmp     incsp1

.endproc

