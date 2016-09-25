#include <SoftwareSerial.h>
SoftwareSerial xbee(0, 1); 

int a;

void setup() {
  Serial.begin(9600);
  Serial.print("A");
  xbee.begin(9600);
  Serial.print("b");
}

void loop() {
  Serial.print("hi");
  if(xbee.available()){
    char a = xbee.read();

    if (a == 1 || a == 3) {
      Serial.println(1);
    }
    else {
      Serial.println(0);
    }
  }
  else
   Serial.println("Zigbee test NO!");

  delay(1000);
}
