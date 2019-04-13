#include <FlexiTimer2.h>
#define RDY_PIN 2
#define TAK_PIN 3

void blink(void);

void setup() {
  // put your setup code here, to run once:
  pinMode(RDY_PIN, OUTPUT);
  pinMode(TAK_PIN, INPUT);
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(RDY_PIN, LOW);
  digitalWrite(LED_BUILTIN, LOW);
  for(uint8_t i = 4; i <= 11; ++i){
    pinMode(i, OUTPUT);
    digitalWrite(i, LOW);
  }
  Serial.begin(9600);
  FlexiTimer2::set(1000, blink);
  FlexiTimer2::start();
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available()){
    uint8_t x = Serial.read();
    Serial.print("Echo 0x");
    Serial.print(x, HEX);
    if(isprint(x)){
      Serial.print(' ');
      Serial.write(x);
    }
    Serial.println();
    for(uint8_t i = 4; i <= 11; ++i){
      //Serial.print(x & 0x01);
      digitalWrite(i, (x & 0x01) ? HIGH : LOW);
      x >>= 1;
    }
    //Serial.println("Data Ready!");
    digitalWrite(RDY_PIN, HIGH);
    while(digitalRead(TAK_PIN) != HIGH);
    //Serial.println("Data Taken!");
    digitalWrite(RDY_PIN, LOW);
    while(digitalRead(TAK_PIN) != LOW);
    //Serial.println("Done.");
  }
  delay(3);
}

void blink(void)
{
  static bool flag = true;
  digitalWrite(LED_BUILTIN, flag);
  flag = !flag;
}

