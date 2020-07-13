void setup() { //canvas setup
  size(500, 300);
  background(#ffffff);
}

void draw(){ 
int x = mouseX; //x position of mouse
int y = mouseY; //y position of mouse 
int i = 0; //increment 
int a = 0; //angle 

while (i < width){ //random blue or red lines will fill the canvas at randomized rotations
  push();
  rotate(a);
  stroke(random(255),0,random(255));
  line(random(i, width), random(i, height), random(i, width), random(i, height));
  pop();

  push();
  //moving the mouse over the lines coloring the canvas will be followed by white strips 
  //mouse position determines maximum height of the strip from the bottom of canvas
  stroke(#ffffff); 
  strokeWeight(5);
  line(x, random(y, width), x, random(y, height)); 
  pop();
  i += 1;
  a += 20;
}
}
  
