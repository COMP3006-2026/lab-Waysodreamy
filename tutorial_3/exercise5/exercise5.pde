size(400,400);
//-------------------------------EXERCISE 5
noStroke();
smooth();
fill(0);
float angle = 0.0;
float scaleVal = 20.0;
float angleInc = PI/10.0;
for (int i=1;i<8;i++){
  float offset = i*height/8;
    for (int x = 0; x <= width; x+= 2) {
      float y = offset + sin(angle) * scaleVal;
      fill(random(255),random(255),random(255)); 
      rect(x, y, 2, 4); // draw the sin function
      y = offset + cos(angle) * scaleVal;
      fill(random(255),random(255),random(255));
      rect(x, y, 2, 4); // draw the cos function
      angle += angleInc;
  }
}
