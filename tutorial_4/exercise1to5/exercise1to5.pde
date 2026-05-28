size(400, 400);
background(255);
rectMode(CENTER);
/*
// Exercise 1
translate(120, 80);
fill(255,0,0);
rect(0, 0, 100, 100);  // Draw rect at original 0,0

translate(56, 156);
fill(0,255,0);
rect(0, 0, 100, 100);  // Draw rect at new 0,0

translate(-156, 50);
fill(0,0,255);
rect(0, 0, 100, 100);  // Draw rect at new 0,0

translate(250,-150);
fill(200);
rect(0, 0, 100, 100);  // Draw rect at new 0,0
*/

/*
//Exercise 2
pushMatrix();
translate(120, 80);
fill(255,0,0);
rect(0, 0, 100, 100);  // Draw rect at new 0,0

pushMatrix();
translate(56, 156);
fill(0,255,0);
rect(0, 0, 100, 100);  // Draw rect at new 0,0

pushMatrix();
translate(-156, 50);
fill(0,0,255);
rect(0, 0, 100, 100);  // Draw rect at new 0,0

popMatrix();
popMatrix();
popMatrix();

fill(200);
rect(0, 0, 100, 100);  // Draw rect at original 0,0
*/

/*
//Exercise 3
pushMatrix();
fill(255,0,0);
translate(120, 80);
rotate(PI/6);
rect(0, 0, 100, 100);  // Draw rect at new 0,0

pushMatrix();
translate(166, 86);
fill(0,255,0);
rotate(PI/10);
rect(0, 0, 100, 100);  // Draw rect at new 0,0

pushMatrix();
translate(-20, 130);
fill(0,0,255);
rotate(PI/6);
rect(0, 0, 100, 100);  // Draw rect at new 0,0

popMatrix();
popMatrix();
popMatrix();

fill(200);
rotate(PI/4);
rect(0, 0, 100, 100);  // Draw rect at original 0,0
*/

/*
//Exercise 4
pushMatrix();
fill(255,0,0);
translate(120, 80);
rotate(PI/6);
rect(0, 0, 100, 100);  // Draw rect at new 0,0

pushMatrix();
translate(206, 56);
fill(0,255,0);
rotate(PI/10);
pushMatrix();
for (int i=0;i<random(10);i++){
  scale(1.1);
  rect(0, 0, 100, 100);  // Draw rect at new 0,0
}
popMatrix();

pushMatrix();
translate(-120, 200);
fill(0,0,255);
rotate(PI/6);
rect(0, 0, 100, 100);  // Draw rect at new 0,0

popMatrix();
popMatrix();
popMatrix();

fill(200);
rotate(PI/4);
rect(0, 0, 100, 100);  // Draw rect at original 0,0
*/

/*
//Exercise 5
pushMatrix();
fill(255,0,0);
translate(120, 80);
rect(0, 0, 100, 100);  // Draw rect at new 0,0
pushMatrix();
translate(180,0);
rotate(PI/4);
rect(0,0,100,100); // Draw transformed rect at new 0,0
popMatrix();

pushMatrix();
translate(166, 156);
fill(0,255,0);
rectMode(CORNER);
rect(0, 0, 120, 100);  // Draw rect at new 0,0
pushMatrix();
rotate(PI/2);
rect(0,0,120,100); //Draw transformed rect
popMatrix();
popMatrix();

pushMatrix();
translate(-20, 170);
fill(0,0,255);
rotate(PI/6);
rect(0, 0, 100, 100);  // Draw rect at new 0,0

popMatrix();
popMatrix();

fill(200);
rotate(PI/4);
rect(0, 0, 100, 100);  // Draw rect at original 0,0
*/
