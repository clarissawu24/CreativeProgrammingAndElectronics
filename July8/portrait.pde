//numbers to position orange fish
int ft1 = 39; //fish tail points
int ft2 = 200;
int ft3 = 79;
int ft4 = 230;
int ft5 = 260;
int fb1 = 120; //fish body
int fb2 = 230;
int fe1 = 155; //fish eye
int fe2 = 220;

//numbers to position orange fish 2
int f2t1 = 139; //fish 2 tail points
int f2t2 = 300;
int f2t3 = 179;
int f2t4 = 330;
int f2t5 = 360;
int f2b1 = 220; //fish 2 body
int f2b2 = 330;
int f2e1 = 255; //fish 2 eye
int f2e2 = 320;

void setup() {
size(500,500);
noStroke(); 
}

void draw(){
//blue background 
fill(#B5E0FF);
rect(0,0,500,500);


//orange fish
fill(#FF8F51); 
triangle(ft1, ft2, ft3, ft4, ft1, ft5); //tail
ellipse(fb1, fb2, 108, 74); //body
fill(#000000);
circle(fe1, fe2, 12); //eye
ft1 = ft1 + 1; //moving fish 
ft2 = ft2 + 1;
ft3 = ft3 + 1;
ft4 = ft4 + 1;
ft5 = ft5 + 1;
fb1 = fb1 + 1;
fb2 = fb2 + 1;
fe1 = fe1 + 1;
fe2 = fe2 + 1;

//orange fish 2
fill(#FF8F51); 
triangle(f2t1, f2t2, f2t3, f2t4, f2t1, f2t5); //tail
ellipse(f2b1, f2b2, 108, 74); //body
fill(#000000);
circle(f2e1, f2e2, 12); //eye
f2t1 = f2t1 + 1; //moving fish 2
f2t2 = f2t2 + 1;
f2t3 = f2t3 + 1;
f2t4 = f2t4 + 1;
f2t5 = f2t5 + 1;
f2b1 = f2b1 + 1;
f2b2 = f2b2 + 1;
f2e1 = f2e1 + 1;
f2e2 = f2e2 + 1;

//coral 
fill(#FF6B4A);
rect(98, 485, 14, 13);
rotate(PI/3);
rect(410, 145, 67, 13);
rotate(-PI/5);
rect(180, 360, 67, 13);
rotate(-PI/2);
rect(-370, 200, 33, 13);
rotate(PI/8);
rect(-250, 380, 49, 13);
rotate(PI/7);
rect(-15, 430, 33, 13);
rotate(PI/2);
rect(400, 5, 33, 13);

//portrait 
fill(#000000); //hair behind head
rect(250, -345, 156, 170);
fill(#FFEDE0); //head
rotate(-PI/2);
ellipse(260, 280, 150, 169);
fill(#000000); //hair infront of head
rotate(-PI/6);
ellipse(90, 310, 122, 51);
fill(#000000); 
rotate(PI/3);
ellipse(375, 50, 99, 51);
fill(#FFEDE0); //neck
rotate(-PI/10);
rect(300, 280, 50, 75);

fill(#B0F1FF); //shirt
circle(320, 465, 250);
rect(200, 450, 248, 120);

fill(#000000); 
circle(280, 230, 12); //left eye
circle(340, 220, 12); //right eye

fill(#FFDBC0); //nose
triangle(310, 220, 315, 260, 300, 260);

fill(#FFB8DA); //mouth 
triangle(310, 280, 315, 270, 300, 270);
}
