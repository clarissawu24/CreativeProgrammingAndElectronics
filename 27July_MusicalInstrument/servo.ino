/* Program for a servo controlled precussion instrument and 4 pressable music keys in notes G,A,B, and D 
 * 
 */
 
#include <Servo.h>

////////////////////// BUTTONS FOR MUSIC NOTES //////////////////////
int piezoPin = 8; //Set up pin connected to Piezo.

int sensorValue = 0;
int button1 = 4; //Set up the input pins connected to the buttons.
int button2 = 5;
int button3 = 6;
int button4 = 7;
int frequency = 0;
const int delayTime = 500; //Set up a constant for the variable of delay time in the tone() function.

////////////////////// SERVO FOR PRECUSSION //////////////////////
Servo myservo;  // create servo object to control a servo

int potpin = 0;  // analog pin used to connect the potentiometer
int val;    // variable to read the value from the analog pin



void setup() {

  //SET BUTTON PINS TO INPUT
  pinMode(button1, INPUT_PULLUP);
  pinMode(button2, INPUT_PULLUP);
  pinMode(button3, INPUT_PULLUP);
  pinMode(button4, INPUT_PULLUP);

  //SERVO PIN
  myservo.attach(9);  // attaches the servo on pin 9 to the servo object
}

void loop() {

  //DEFINE BUTTONS TO MUSIC NOTES: G, A, B, D 

  if (digitalRead(button1) == LOW) {
    frequency = 392; //G
  }
  else if (digitalRead(button2) == LOW) {
    frequency = 440; //A
  }
  else if (digitalRead(button3) == LOW) {
    frequency = 493; //B
  }
  else if (digitalRead(button4) == LOW) {
    frequency = 587; //D
  }
  else {
    frequency = 0;
  }
  tone(piezoPin, frequency, delayTime); //SET UP TONE FUNCTION WITH MUSIC NOTES 

  val = analogRead(potpin);            // READ POTENTIOMETER (value between 0 and 1023)
  val = map(val, 0, 1023, 0, 180);     // SCALE TO SERVO VALUES (value between 0 and 180)
  myservo.write(val);                  // SET SERVO POSITION BASED ON SCALED VALUES
  delay(15);                           // WAIT FOR SERVO TO GET TO POSITION 

}
