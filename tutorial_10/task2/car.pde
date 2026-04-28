class Car {
  PVector pos = new PVector();
  float scaleFactor = 1;
  color bodyColor;

  void drawCar() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    scale(scaleFactor);

    fill(bodyColor);
    noStroke();
    box(200,40,90);
    
    pushMatrix();
    translate(0, -40, 0);      // move upward (Y axis)
    box(120, 40, 90);          // smaller box on top
    popMatrix();


    fill(40);
    drawWheel(-70, 25, -45);
    drawWheel( 70, 25, -45);
    drawWheel(-70, 25,  45);
    drawWheel( 70, 25,  45);

    popMatrix();
  }
}

// ===== Wheel =====
void drawWheel(float x, float y, float z) {
  float r = 20, w = 14;
  int detail = 18;

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
