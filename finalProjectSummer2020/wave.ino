////////// PROJECT DESCRIPTION //////////
// this prject uses an ultrasonic sensor to detect distance
// if it senses that the distance is less than 10, which means that something is close to it,
// the LED lights change color and servo moves to pull a string which holds a paper kinetic sculpture


////////// NEOPIXEL LIBRARY SETUP //////////
#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
#include <avr/power.h>
#endif
#define PIN        6
#define NUMPIXELS  8

Adafruit_NeoPixel pixels(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);
#define DELAYVAL 300


////////// SERVO LIBRARY SETUP //////////
#include <Servo.h>
Servo servo1;
int trigPin = 9;
int echoPin = 8;
int servPin = 7;
long distance;
long duration;

void setup() {

#if defined(__AVR_ATtiny85__) && (F_CPU == 16000000)
  clock_prescale_set(clock_div_1);
#endif

  pixels.begin(); //initialize LED Strip

  Serial.begin(9600);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);  // ultrasonic pin set up

  servo1.attach(servPin);   // servo pin
  servo1.write(90);

}

////////// ULTRASONIC CONTROLLS LEDs AND SERVO //////////

void loop() {

  ultra();
  if (distance <= 10) {   // if ultrasonic detects something in front of it, LED lights and servo turn on

    servo1.attach(servPin);
    servo1.write(100);


    pixels.clear();

    for (int i = 0; i < NUMPIXELS; i++) {

      pixels.setPixelColor(i, pixels.Color(100 - (i * 25), 100 - (i * 10), 100 + (i * 20)));
      pixels.show();
      delay(DELAYVAL);
    }

  }
  else {                  
    servo1.detach();                // detaching the servo stops it from rotating

    for (int i = 0; i < NUMPIXELS; i++) {   

      pixels.setPixelColor(i, pixels.Color(100, 100, 100));
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
