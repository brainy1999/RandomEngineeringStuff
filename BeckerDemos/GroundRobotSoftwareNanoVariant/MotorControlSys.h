#include <PID_v1.h>
#include <AFMotor.h>
#include "Arduino.h"
#include "SN75Driver.h"



  
class MotorControlSys
{



   bool textprintchecker = true;
   
  public: MotorControlSys() //Constructor
  {

  }

public: void TextPrintChecker(bool onoroff) {
  textprintchecker = onoroff;
}

public: void StartMotorControler(){

 //MCUnit.StartMotorControler();
 //MCUnit.TextPrintChecker(true);
  motor1.setSpeed(255);
  motor2.setSpeed(255);
  motor3.setSpeed(255);
  motor4.setSpeed(255);
  M5M6J.TextPrintChecker(false);
  M5M6J.StartMotorControler();
  
 Serial.println(" - all motor controllers ok"); 



public: void writeAll(int InMotor) {


  }


  
};
