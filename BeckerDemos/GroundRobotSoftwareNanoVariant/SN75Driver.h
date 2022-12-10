/*
LIMITED TECHNOLOGIES LLC
SN754410 Driver SOFTWARE 1.1
REVISION - 91522
notes for each command are stationed in each section

*/

#include "Arduino.h"

class SN75Driver
{
 uint8_t Lmotor1;
 uint8_t Lmotor2;
 uint8_t Lmotor3;
 uint8_t Lmotor4;
 bool textprintchecker = false;


public: SN75Driver(uint8_t An1, uint8_t An2, uint8_t An3, uint8_t An4) //Constructor
{
  Lmotor1 = An1;
  Lmotor2 = An2;
  Lmotor3 = An3;
  Lmotor4 = An4;
}


public: void StartMotorControler() {
   pinMode(Lmotor1, OUTPUT);
   pinMode(Lmotor2, OUTPUT);
   pinMode(Lmotor3, OUTPUT);
   pinMode(Lmotor4, OUTPUT);

   if(textprintchecker==true) {
       Serial.print("Boot Ok  ");
   }
}

public: void TextPrintChecker(bool truefalse) {
  textprintchecker = truefalse;
}

public: void LmotorMove(boolean direction, int movespeed)
 { //Moves left motor. Syntax Motorcontrollername.LmotorMove(direction, speed); FALSE = forward TRUE = backwards
  String type ="Left Motor Moving";
  String movementdirection = "";
  if(direction == false){
    digitalWrite(Lmotor1, HIGH); // left motor move
    digitalWrite(Lmotor2, LOW);
    movementdirection = "Forward";
  }
  else if(direction == true){
    digitalWrite(Lmotor1, LOW); // left motor move
    digitalWrite(Lmotor2, HIGH);
    movementdirection = "Backward";
  }
  MovePrinter(type,movementdirection,movespeed);
 }
public: void LmotorStop()
 { //Stops left motor. Syntax Motorcontrollername.LmotorStop();
  String type ="Left Motor - ";
  String movementdirection = "";
  int movespeed = 0;
    digitalWrite(Lmotor1, LOW); // left motor move
    digitalWrite(Lmotor2, LOW);
    movementdirection = "stopping";
  
  MovePrinter(type,movementdirection,movespeed);
 }

 public: void RmotorMove(boolean direction, int movespeed)
 { //Moves right motor. Syntax Motorcontrollername.LmotorMove(direction, speed); FALSE = forward TRUE = backwards
  String type ="Right Motor Moving";
  String movementdirection = "";
  if(direction == false){
    digitalWrite(Lmotor3, HIGH); // left motor move
    digitalWrite(Lmotor4, LOW);
    movementdirection = "Forward";
  }
  else if(direction == true){
    digitalWrite(Lmotor3, LOW); // left motor move
    digitalWrite(Lmotor4, HIGH);
    movementdirection = "Backward";
  }
  MovePrinter(type,movementdirection,movespeed);
 }
public: void RmotorStop()
 { //Stops right motor. Syntax Motorcontrollername.LmotorStop();
  String type ="Right Motor - ";
  String movementdirection = "";
  int movespeed = 0;
    digitalWrite(Lmotor3, LOW); // left motor move
    digitalWrite(Lmotor4, LOW);
    movementdirection = "stopping";
  
  MovePrinter(type,movementdirection,movespeed);
 }
public: void MovePrinter(String type, String movementdirection, int movespeed) 
  { //prints the movement text. Can be disabled
  if(textprintchecker == true && Serial.read() != -1) {
  Serial.print("Move Type---"); Serial.println(type);
  Serial.print("move direction---"); Serial.println(movementdirection);
  Serial.print("move speed---");  Serial.println(movespeed);
    }
  }
};
