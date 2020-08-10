////////// PROJECT DESCRIPTION //////////
// this prject uses an ultrasonic sensor to detect distance
// if it senses that the distance is less than 10, which means that something is close to it,
// the LED lights change color and servo moves to pull a string which holds a paper kinetic sculpture 


////////// NEOPIXEL LIBRARY //////////
#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
#include <avr/power.h>
#endif

#define PIN            6 //LED PIN
#define NUMPIXELS      8 //number of LED lights
Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);
int delayval = 10; // delay LED lights for half a second

////////// SERVO LIBRARY //////////
#include <Servo.h>
Servo servo1;
int trigPin = 9;
int echoPin = 8;
long distance;
long duration;

void setup() {

  pixels.begin(); // initializes the NeoPixel library.

  Serial.begin(9600);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);// ultrasonic pin set up

  servo1.attach(7);  //SERVO PIN
}

////////// ULTRASONIC CONTROLLS LEDs AND SERVO //////////

void loop() {

  ultra();
  if (distance <= 10) {   //if ultrasonic detects distance less than 10, LED lights and servo turn on
    
    servo1.write(10);

    for (int i = 0; i < NUMPIXELS; i++) {
      pixels.setPixelColor(i, pixels.Color(0, distance, random(100, 255))); //random bluer color
      pixels.setBrightness(60);
      pixels.show(); 
      delay(delayval); 
    }

  }
  else {
    servo1.write(180);
    
    for (int i = 0; i < NUMPIXELS; i++) {
      pixels.setPixelColor(i, pixels.Color(0, distance, 250)); // random blue-green color
      pixels.setBrightness(50);
      pixels.show(); 
    }
  }
  Serial.println(distance);
}

void ultra() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  duration = pulseIn(echoPin, HIGH);
  distance = duration * 0.034 / 2;
}
