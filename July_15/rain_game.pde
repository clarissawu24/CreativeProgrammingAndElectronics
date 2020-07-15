// class for rainfall in on the screen
class Rain {
  float x; // x postion of drop
  float y; // y position of drop
  float z; // z position of drop 
  float len; // length of the drop
  float yspeed; // speed of the drop
  
  //the higher the z value the closer the drop is to the screen.
  Rain() {
    x  = random(width); // random x position ie width because anywhere along the width of screen
    y  = random(-500, -50); // random y position
    z  = random(0, 20); // z value for a perspective view 
    len = 10; // length of rain drop 
    yspeed  = map(z, 0, 20, 1, 20); // if z is perceptually closer to screen drop is faster
  }

  void fall() { // function to determine the speed and shape of the drop 
    y = y + yspeed; // increment y position to give the effect of falling 
    float grav = map(z, 0, 20, 0, 0.2); // if z is near then more gravity
    yspeed = yspeed + grav; // speed increases as gravity acts on the drop

    if (y > height) { // new rain after rain falls off the screen
      y = random(-200, -100);
      yspeed = map(z, 0, 20, 4, 10);
    }
  }

  void show() { // function to make rain on the screen
    strokeCap(ROUND); // round lines of rain
    strokeWeight(3.5); // weight of the drop
    stroke(0); // rain color
    line(x, y, x, y+len); // draws the line with two points 
  }
}

Rain[] drops = new Rain[200]; // limit for 200 drops at a time

// Variables for falling raindrop
float x0 = 200; 
float y0 = 0;
float y0_speed = 10;

// Canvas setup 
void setup() {
  size(500,500);
  for (int i = 0; i < drops.length; i++) { // creating the different drops 
    drops[i] = new Rain();
  }
}

void draw() {
  background(255);
  
  // floof character image
  PImage floof = loadImage("floof.png");
  floof.resize(200, 200);
  image(floof, 150, 300);
  // moving leaf umbrella image
  PImage leaf = loadImage("leaf.png");
  leaf.resize(200, 200);
  image(leaf, mouseX, mouseY);
  
  // Check if raindrop falls on top of the leaf
  if(y0 > height+15)  //15 is the radius of the ball
  {
    y0 = -15; //Move it back to just above the screen
    x0 = random(width); //Pick a new random horizontal location on the canvas
    y0_speed = random(10,20); //Pick a new random speed between 10 and 20
  }
     if(x0 >= width-mouseX && y0 >= height-mouseY) 
  {
    y0 = -15; //Move it back to just above the screen
    x0 = random(width); //Pick a new random horizontal location on the canvas
    y0_speed = random(10,20); //Pick a new random speed between 10 and 20
  }
  
  // raindrop speed updates each loop
  y0 += y0_speed; 
  // raindrop image 
  PImage raindrop = loadImage("raindrop.png");
  raindrop.resize(70, 70);
  image(raindrop, x0, y0);
  
  // initiate rain fall on the screen 
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall(); // shape and speed of drop
    drops[i].show(); // render drop
  }
}
  
