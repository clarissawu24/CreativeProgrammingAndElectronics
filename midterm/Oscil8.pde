////////////////// IMPORTS AND CLASS CALLS ///////////////////
import ddf.minim.*;         
import processing.sound.*;
Minim minim;
AudioInput in;
Amplitude loudness;
Catcher catcher;

////////////////// VARIABLES ///////////////////
int score = 0;                            // score tracker 
int mallets = 8;                          // number of oscillating mallets 
float shrink = 300;                       // background rings will shrink from radius 200 
float rotateDegrees = 1;                  // rotating the circles along the path of the rings 

Dot[] dots = new Dot[100];                // 100 particles to fall at a time
Oscil[] oscil = new Oscil[mallets];       // initializing first 8 mallets 

////////////////// Game Start and Reset ///////////////////
boolean gameStart = false;  // game doesn't start until a key is pressed 
void keyPressed() {
  gameStart = true;
  score = 0;
}

////////////////// VISUALIZER SET UP ///////////////////
void setup() {
  size(800, 600, P3D);

  minim = new Minim(this);                   // minim initiates audio input 
  in = minim.getLineIn();
  catcher = new Catcher(32);                 // creating catcher radius 32

  for (int i = 0; i < oscil.length; i++) {   // initiating oscillating mallets 
    oscil[i] = new Oscil();
  }
  for (int i = 0; i < dots.length; i++) {    // initiating falling particles to catch  
    dots[i] = new Dot();
  }

  loudness = new Amplitude(this);            // detects the volume of audio input 
  loudness.input(new AudioIn(this, 0));
}

////////////////// VISUALIZER DRAW START ///////////////////
void draw() {

  background(149, 202, 255); 
  
  /// START SCREEN ///
  for (int i = 0; i < oscil.length; i++) {        // initiate oscillating mallets
    oscil[i].oscillate();
    oscil[i].display();
  }
  pushMatrix();                                   // initiate background rings that grow with volume
  translate(width/2, height/2);
  float volume = loudness.analyze();              // volume = loudness of audio input 
  int size = int(map(volume, 0, 0.5, 1, 350));    // size = how much the ring grows based on volume
  noFill();

  stroke(255);
  ellipse(0, 0, shrink+(size/10), shrink+(size/10));   // ring order from big to small (out to in) 

  stroke(255, 225, 253);
  ellipse(0, 0, (shrink-5)+(size/10), (shrink-5)+(size/10));

  stroke(255);
  ellipse(0, 0, (shrink-10)+(size/10), (shrink-10)+(size/10));

  ellipse(0, 0, (shrink-20)+(size/10), (shrink-20)+(size/10));
  popMatrix();
 
  if (gameStart == false && score == 0) {          // instructions text 
    textAlign(CENTER);
    fill(255); 
    textSize(16);  
    text("Play your favorite tunes~", width/2, height - 90);
    text("and catch as many dots as you can before the rings close!", width/2, height - 70);
    textSize(20);  
    text("press any key to START", width/2, height - 45);
  }

  /// RESET SCREEN ///
  if (gameStart == false && score > 0) {            // after game is over, the players score is displayed and given the option to restart
    textSize(20);
    fill(255);
    textAlign(CENTER);
    text("Nice! You got"+" "+score+" "+"dots!", width/2, height - 80);
    text("press any key to RESTART", width/2, height - 45);
  }

  /// GAME STARTS ///
  if (gameStart) {                                  // key pressed: game begins 
    catcher.setLocation(mouseX, mouseY);            // set catcher location: dot catcher follows mouse 
    catcher.display();                              // display the catcher


    for (int i = 0; i < dots.length; i++ ) {        // initiate falling dots
      dots[i].move();
      dots[i].display();
      if (catcher.intersect(dots[i])) {
        dots[i].caught();
      }
    }

    shrink = shrink - 0.4;                          // shrink value decreases to shrink rings which act as a "timer" for how long the player has to play  
    pushMatrix();
    translate(width/2, height/2);

    push();                                         // white circle travelling on ring path
    fill(255);
    rotateZ(rotateDegrees);
    ellipse(shrink/3, shrink/3, 10, 10);            // using shrink as reference to stay on ring path
    rotateDegrees += 0.05;                          // incrementing rotateDegrees to make circle move (changes the speed)
    pop();

    push();                                         // pink ring traveling on ring path 
    stroke(255, 225, 253);
    noFill();
    rotateZ(-rotateDegrees);                        // going along the path at the opposite direction of the white circle
    ellipse(shrink/3, shrink/3, 30, 30);            // using shrink as reference to stay on ring path
    ellipse(shrink/3, shrink/3, 25, 25);
    rotateDegrees += 0.01;                          // incrementing rotateDegrees to make circle move (changes the speed)
    pop();
    popMatrix();

  }
  /// GAME RESTART SETTINGS ///
  if (shrink < 30) {                        // game stops once the rings reach a diameter of 30 
    gameStart = false;
    shrink = 300;                           // reset ring for next game 
    for (int i = 0; i < dots.length; i++) { // reset falling dots 
      dots[i] = new Dot();
    }
  }
}

////////////////// CLASS DEFINITIONS ///////////////////

class Dot {
  float x, y;   // variables for x, y locations of raindrop
  float speed;  // speed of falling dot
  float r;      // radius of dot

  Dot() {
    r = random(10, 15);      // dots randomly sized between 10 and 15
    x = random(width);       // start with a random x location
    y = -r*2;                // start a little above the window
    speed = random(1, 10);   // pick a random speed between 1 and 10
  }

  void move() {              // move the dot down
    y = y + speed;           // increment by speed
    if (y > height) {        // checks if dot is offscreen
      y = -100;              // if offscreen, set location to be offscreen at -100
    }
  }

  void display() {           // display dots
    fill(255);
    ellipse(x, y, r, r);
  }
  
  /// IF DOT IS CAUGHT /// 
  void caught() {
    speed = 0;               // stop the dot from moving by setting speed equal to 0
    y = -100;                // set the location to somewhere way offscreen
    score = score + 1;       // update score per dot caught 
  }
}


class Catcher {
  float r;    // radius
  color c;    // color
  float x, y; // location

  Catcher(float tempR) {                         // temporary fillers for catcher radius
    r = tempR;
    c = color(255, 225, 253, 90);
    x = 0;
    y = 0;
  }

  void setLocation(float tempX, float tempY) {   // temporary fillers for catcher x, y positions
    x = tempX;
    y = tempY;
  }

  void display() {                               // create catcher that also grows based on with audio input 
    noStroke();
    fill(c);
    for (int i = 0; i < in.bufferSize()-1; i++)  
    {
      stroke(225-(in.right.get(i)*40), 255-(in.left.get(i)*100), 255);  // stroke color slightly changes based on time it takes to process any incoming audio signal
      ellipse(x, y, 25+(in.right.get(i)*100), 25+(in.left.get(i)*100)); // catcher size 25 and grows slightly based on audio input volume 
    }
  }

  boolean intersect(Dot d) {                     // function returns true or false based on minimal distance between catcher and dot
    float distance = dist(x, y, d.x, d.y);       // calculate distance
    if (distance <  d.r) {                       // compare distance to sum of radii
      return true;
    } else {
      return false;
    }
  }
}

class Oscil {                                              
  PVector angle;             // angle mallet will be rotating
  PVector velocity;          // velocity mallet will be moving 
  PVector amplitude;         // amplitude determines how long mallet extends

  Oscil() {
    angle = new PVector();
    velocity = new PVector(random(-0.03, 0.03), random(-0.03, 0.03));
    amplitude = new PVector(random(width/2), random(height/2));
  }

  void oscillate() {         // move mallets 
    angle.add(velocity);
  }

  void display() {           // create mallets 
    float x = sin(angle.x)*amplitude.x;
    float y = sin(angle.y)*amplitude.y;

    pushMatrix();         
    translate(width/2, height/2); // position to center the oscillating mallets 
    stroke(255);
    fill(149, 202, 255);
    line(0, 0, x, y);
    
    for (int i = 0; i < in.bufferSize()-1; i++)   
    {
      stroke(255-(in.right.get(i)*40), 255-(in.left.get(i)*100), 255);   // stroke color slightly changes based on time it takes to process any incoming audio signal
      ellipse(x, y, 5+(in.right.get(i)*250), 5+(in.left.get(i)*250));    // mallet circles grow and shrink based on audio input volume
    }

    popMatrix();
  }
}
