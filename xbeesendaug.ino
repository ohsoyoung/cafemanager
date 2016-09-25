#include <SoftwareSerial.h>
SoftwareSerial xbee(0 , 1);

int LED = 3;
int PIR = 2;
int val = 0;

void setup() {
  Serial.begin(9600);
  xbee.begin(9600);

  pinMode(A0, INPUT);
  pinMode(12, OUTPUT);

  pinMode(LED, OUTPUT);
  pinMode(PIR, INPUT);
}
void loop() {
  // put your main code here, to run repeatedly:
  int a = digitalRead(A0);
  val = digitalRead(PIR);

  if (a == 1) {
    Serial.println(a);
    //digitalRead(12, a);
    xbee.write(1);
   }
   else {
     xbee.write(4); // 왜 0안되는지..
   }

   if (val == HIGH) {
     xbee.write(3);
     //digitalWrite(LED, HIGH);
     Serial.println(3);
   }
   else {
     xbee.write(2);
     //digitalWrite(LED, LOW);
     Serial.println(2);
   }

  delay(1000);
}
