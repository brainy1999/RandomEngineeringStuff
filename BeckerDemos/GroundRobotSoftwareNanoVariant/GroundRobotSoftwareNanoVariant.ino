/*
Ground Robot Software

LIMITED TECHNOLOGIES LLC
GroundRobot Type S MARK 1.1 SOFTWARE 3.2 for AtMega328p
*/

#include "SN75Driver.h"


SN75Driver M1M2(2,3,4,5); //activate m1 and m2
SN75Driver M3M4(6,7,8,9); //activate m3 and m4
SN75Driver M5M6(10,11,12,13); //activate m5 and m6


int potVales[] = {0,0,0,0,0};
//pins for resistors
#define m1Pot A0
#define m2Pot A1
#define m3Pot A2
#define m4Pot A3
#define m5Pot A4

//variables
int CommandByte = 0;
int delayforward = 250;
int delaybackward = 500;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
//  Serial.println("M1 M2 M3 M4 M5"); 
  allpotvolts(); 
//  printpotvals();

  M1M2.StartMotorControler();
  M3M4.StartMotorControler();
  M5M6.StartMotorControler();
  Serial.println("Boot ok");
}

void loop() {
  allpotvolts();
  if (Serial.available() > 0) {// read the incoming byte:
    CommandByte = Serial.read();
    //Serial.println(CommandByte, BIN);
  }
  

{  //Command Code
  if(CommandByte == 49) { //M1 Forward, press key 1
  Serial.println("  M1 - MovingForward");
  M1M2.LmotorMove(0, 256);
  delay(delayforward);
  M1M2.LmotorStop();
  allpotvolts();
  }
  if(CommandByte == 52) { //M1 Backward, press key 4
  Serial.println(" M1 - MovingBackwards");
  M1M2.LmotorMove(1, 256);
  delay(delaybackward);
  M1M2.LmotorStop();
  allpotvolts();
  }
  if(CommandByte == 50) { //M2 Forward, press key 2
  Serial.println("  M2 - MovingForward");
  M1M2.RmotorMove(0, 256);
  delay(delaybackward);
  M1M2.RmotorStop();
  allpotvolts();
  }
  if(CommandByte == 53) { //M2 Backward, press key 5
  Serial.println(" M2 - MovingBackwards");
  M1M2.RmotorMove(1, 256);
  delay(delaybackward);
  M1M2.RmotorStop();
  allpotvolts();
  }
  if(CommandByte == 51) { //M3 Forward, press key 3
  Serial.println("  M3 - MovingForward");
  M3M4.LmotorMove(0, 256);
  delay(delayforward);
  M3M4.LmotorStop();
  allpotvolts();
  }
  if(CommandByte == 54) { //M3 Backward, press key 6
  Serial.println(" M3 - MovingBackwards");
  M3M4.LmotorMove(1, 256);
  delay(delaybackward);
  M3M4.LmotorStop();
  allpotvolts();
  }
  if(CommandByte == 55) { //M4 Forward, press key 7
  Serial.println("  M4 - MovingForward");
  M3M4.RmotorMove(0, 256);
  delay(delaybackward);
  M3M4.RmotorStop();
  allpotvolts();
  }
  if(CommandByte == 56) { //M4 Backward, press key 8
  Serial.println(" M4 - MovingBackwards");
  M3M4.RmotorMove(1, 256);
  delay(delaybackward);
  M3M4.RmotorStop();
  allpotvolts();
  }
  if(CommandByte == 57) { //M5 Forward, press key 9
  Serial.println("  M5 - MovingForward");
  M5M6.LmotorMove(0, 256);
  delay(delayforward);
  M5M6.LmotorStop();
  allpotvolts();
  }
  if(CommandByte == 42) { //M5 Backward, press key *
  Serial.println(" M5 - MovingBackwards");
  M5M6.LmotorMove(1, 256);
  delay(delayforward);
  M5M6.LmotorStop();
  allpotvolts();
  }
} 

{ //Demo3 Code
  
}
}

void allpotvolts() {

  potVales[0] = analogRead(m1Pot);
  potVales[1] = analogRead(m2Pot);
  potVales[2] = analogRead(m3Pot);
  potVales[3] = analogRead(m4Pot);
  potVales[4] = analogRead(m5Pot); 
  
}
void printpotvals() {
//  Serial.print("PotVals - ");
  Serial.print(potVales[0]);
  Serial.print("  ");
  Serial.print(potVales[1]);
  Serial.print("  ");
  Serial.print(potVales[2]);
  Serial.print("  ");
  Serial.print(potVales[3]);
  Serial.print("  ");
  Serial.println(potVales[4]);
}
