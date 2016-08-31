#include <SPI.h>
#include <WString.h>
#include <Ethernet.h>

byte mac[] = {
0x9C, 0xF3, 0x87, 0xCC, 0xFB, 0xC1 };
byte mac2[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
IPAddress ip(192, 168, 25, 3);
byte gateway[] = { 192, 168, 25, 1 };
byte subnet[] = { 255, 255, 255, 0 };
EthernetServer server(80);
boolean SENSORON = false;

void setup() {
  Serial.begin(9600);

  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  Serial.print("ccc");
  // start the Ethernet connection and the server:
  Ethernet.begin(mac, ip, gateway, subnet);
  Serial.print("AAA");

  server.begin();
  Serial.print("server is at ");
  Serial.println(Ethernet.localIP());
  Serial.println(Ethernet.gatewayIP());
  
  pinMode(A0, INPUT);
  pinMode(12, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  EthernetClient client = server.available();
  int a = digitalRead(A0);

//  if (a == 1)   //A0에 연결된 센서에 인식되면 1이므로
//     Serial.println("a =" +a);
  delay(1000);
  
  /*if(Ethernet.begin(mac2, ip, gateway, subnet)){
    Serial.println("c");
  }
  if(Ethernet.begin(mac2, ip)){
    Serial.println("d");
  }*/

  Serial.println("server=" + server.available());
  
  if (client) {
    while (client.connected()) {
      if (client.available()) {
        char c = client.read();
          
        Serial.print(c);

          if (c == '\n') {
            if (a == 1) {
              digitalWrite(12, a);
              Serial.println(a);
              SENSORON = true;
            }
            else {
              digitalWrite(12, a);
              Serial.println(a);
              SENSORON = false;
            }
      Serial.println("connected");
   
      client.print("GET /cafe/CafeDetailInfo.jsp?id=abcd");
      client.println("HTTP/1.1");
      client.println("Host: 210.121.131.58:8080/cafe/CafeDetailInfo.jsp?id=abcd");
      client.println("Connection: close");
      client.println();
      }
    }
  }
 // delay(500);
  client.stop();
  Serial.println("client disonnected");
  }
  else {
    Serial.println("no connect");
  }
}
