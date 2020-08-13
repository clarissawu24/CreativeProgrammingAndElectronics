//// This is a program for a randomized wave generator to mimic the motion of mesh cloth

import processing.serial.*; //importing serial library 

Serial arduino;
int serialIn;

int color1 = color(0, 194, 241, 60);   //blue back color 
int color2 = color(161, 94, 223, 60);  //purple front color 
float n = 50;                          // number of lines creating wave
float zoff = 0;                        // starting z position for 3D effect

void setup() {
  fullScreen(P3D);
  printArray(Serial.list());
  arduino = new Serial(this, "/dev/cu.usbmodem14101", 9600);

  background(10);
}

void draw() {
  background(10);
  noFill();

  if ( arduino.available() > 0)       // if arduino data is available
  {  
    serialIn = arduino.read();         // read it and store it in seralIn
  } 
  println(serialIn); //print it out in the console

  if (serialIn < 30) {               // if serial reads ultrasonic sensor's distance to be under 30, wave shows up
    for (int i = 0; i < n; i++) {
      int blend = lerpColor(color1, color2, i / (n - 1));  // blends color 1 and 2 to create a gradient effect as it adds curved lines

      stroke(blend);                                       // update stroke color to newly blended color
      strokeWeight((n - i) * 1.5);

      beginShape();
      for (float x = -5; x <= width + 5; x++) {
        float y = map(noise(x * 0.00085, i * 0.02, zoff), 0, 1, 0, height);  //use noise function to generate random y values to position curves  
        vertex(x, y);                                                        // the larger the y value the wider in height the wave can get
      }
      endShape();
    }

    zoff += 0.006;                                         // update z position, the larger the value the faster the wave moves
  }
}
