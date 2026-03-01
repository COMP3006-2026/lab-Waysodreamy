size(200,200);
background(255);
smooth();

//set to center
ellipseMode(CENTER);
rectMode(CENTER);

//Zoog's body
stroke(0);
strokeWeight(3);
fill(150);
rect(100,100,20,100);

//Zoog's Head
strokeWeight(2);
fill(255);
ellipse(100,70,60,60);
//eyes
fill(255,0,0);
ellipse(85,70,16,32);
ellipse(115,70,16,32);
//hair
fill(255,255,0);
strokeWeight(0);
bezier(75,50,80,30,120,30,125,50);
//mouth
strokeWeight(3);
noFill();
bezier(85,90,90,95,110,95,115,90);

//Zoog's limbs
strokeWeight(3);
line(90,100,60,85);
line(110,100,125,140);
line(90,150,88,180);
line(110,150,112,180);
line(88,180,85,180);
line(112,180,115,180);
