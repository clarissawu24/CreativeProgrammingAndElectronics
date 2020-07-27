/* Program for a servo controlled precussion instrument and 4 pressable music keys in notes G,A,B, and D 
 * 
 */
 
#include <Servo.h>

////////////////////// BUTTONS FOR MUSIC NOTES //////////////////////

int sensorValue = 0;
int buttonG = 4; 
int buttonA = 5;
int buttonB = 6;
int buttonD = 7;
int frequency = 0;
const int delayTime = 500; //DELAY TIME FOR TONE FUNCTION 

int piezoPin = 8; //PIN CONNECTED TO PIEZO 

////////////////////// SERVO FOR PRECUSSION //////////////////////
Servo myservo;  // create servo object to control a servo

int potpin = 0;  // PIN CONNECTED TO POTENTIOMETER 
int val;    // READING FROM POTENTIOMETER 


void setup() {

  //SET BUTTON PINS TO INPUT
  pinMode(buttonG, INPUT_PULLUP);
  pinMode(buttonA, INPUT_PULLUP);
  pinMode(buttonB, INPUT_PULLUP);
  pinMode(buttonD, INPUT_PULLUP);

  //SERVO PIN
  myservo.attach(9);  // ASSIGN SERVO TO PIN 9
}

void loop() {

  //DEFINE BUTTONS TO MUSIC NOTES: G, A, B, D 

  if (digitalRead(buttonG) == LOW) {
    frequency = 392; //G
  }
  else if (digitalRead(buttonA) == LOW) {
    frequency = 440; //A
  }
  else if (digitalRead(buttonB) == LOW) {
    frequency = 493; //B
  }
  else if (digitalRead(buttonD) == LOW) {
    frequency = 587; //D
  }
  else {
    frequency = 0;
  }
  tone(piezoPin, frequency, delayTime); //SET UP TONE FUNCTION WITH MUSIC NOTES 

  val = analogRead(potpin);            // READ POTENTIOMETER (value between 0 and 1023)
  val = map(val, 0, 1023, 0, 180);     // SCALE TO SERVO VALUES (value between 0 and 180)
  myservo.write(val);                  // SET SERVO POSITION BASED ON SCALED VALUES

}
