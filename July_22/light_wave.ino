/*
Mini Light Wave
This program allows the user to press a button to turn on 
the starter LED light. A photoresister is placed next to 
the first LED to sense whether it is on or off. If the light is on, 
the photoresister signals the rest of the LED lights to turn off. 
Once the switch is not pressed, the first LED light turns off and 
the subsequent LED lights turn off. 
*/

void setup() {
  pinMode(9, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(13, OUTPUT);
  pinMode(A0, INPUT);
  Serial.begin(9600);
}

void loop() {

  int switchPosition = digitalRead(A0);
  int sensorValue = analogRead(A2);
  
  //if switch is pressed (HIGH), first LED Light turns on (HIGH)
  if (switchPosition == LOW) { 
    digitalWrite(13, LOW);
  } else  {
    digitalWrite(13, HIGH);
  }

  //if the photoresister sensor value is greater than 550, 
  //the second and third LED lights also turn on 
  if (sensorValue > 550) {
    digitalWrite(11, HIGH);
    delay(200);
    digitalWrite(9, HIGH);
    }
    // LED lights turn off if sensor value is below 600 
    if (sensorValue < 600) {
    digitalWrite(11, LOW);
    delay(200);
    digitalWrite(9, LOW);
      }
  // print out the value you read:
  Serial.println(sensorValue);
  delay(1);        // delay in between reads for stability
}
