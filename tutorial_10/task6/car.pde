class Car {
  PVector pos = new PVector();
  color bodyColor;
  float rotY = 0, scaleFactor = 1, alpha = 255;

  void drawCar() {
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    rotateY(rotY);
    scale(scaleFactor);
    
    fill(bodyColor,alpha);
    noStroke();
    box(200,40,90);
    
    pushMatrix();
    translate(0, -40, 0);      // move upward (Y axis)
    box(120, 40, 90);          // smaller box on top
    popMatrix();
    
    fill(40);
    drawWheel(-70,25,-45);
    drawWheel( 70,25,-45);
    drawWheel(-70,25, 45);
    drawWheel( 70,25, 45);
    popMatrix();
  }
}

void drawWheel(float x, float y, float z) {
  float r = 20, w = 14;
  int detail = 24;

  pushMatrix();
  translate(x, y, z);
  rotateZ(HALF_PI);

  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i <= detail; i++) {
    float a = TWO_PI * i / detail;
    vertex(cos(a)*r, sin(a)*r,  w/2);
    vertex(cos(a)*r, sin(a)*r, -w/2);
  }
  endShape();

  beginShape(TRIANGLE_FAN);
  vertex(0,0,w/2);
  for (int i = 0; i <= detail; i++) {
    float a = TWO_PI * i / detail;
    vertex(cos(a)*r, sin(a)*r, w/2);
  }
  endShape();

  beginShape(TRIANGLE_FAN);
  vertex(0,0,-w/2);
  for (int i = 0; i <= detail; i++) {
    float a = -TWO_PI * i / detail;
    vertex(cos(a)*r, sin(a)*r, -w/2);
  }
  endShape();

  popMatrix();
}
