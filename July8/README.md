//numbers to move orange fish
int t1 = 39;
int t2 = 200;
int t3 = 79;
int t4 = 230;
int t5 = 260;
int e1 = 120;
int e2 = 230;
int c1 = 155;
int c2 = 220;

//numbers to move orange fish 2
int ft1 = 139;
int ft2 = 300;
int ft3 = 179;
int ft4 = 330;
int ft5 = 360;
int fe1 = 220;
int fe2 = 330;
int fc1 = 255;
int fc2 = 320;

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
triangle(t1, t2, t3, t4, t1, t5); //tail
ellipse(e1, e2, 108, 74); //body
fill(#000000);
circle(c1, c2, 12); //eye
t1 = t1 + 1;
t2 = t2 + 1;
t3 = t3 + 1;
t4 = t4 + 1;
t5 = t5 + 1;
e1 = e1 + 1;
e2 = e2 + 1;
c1 = c1 + 1;
c2 = c2 + 1;

//orange fish 2
fill(#FF8F51); 
triangle(ft1, ft2, ft3, ft4, ft1, ft5); //tail
ellipse(fe1, fe2, 108, 74); //body
fill(#000000);
circle(fc1, fc2, 12); //eye
ft1 = ft1 + 1;
ft2 = ft2 + 1;
ft3 = ft3 + 1;
ft4 = ft4 + 1;
ft5 = ft5 + 1;
fe1 = fe1 + 1;
fe2 = fe2 + 1;
fc1 = fc1 + 1;
fc2 = fc2 + 1;

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


