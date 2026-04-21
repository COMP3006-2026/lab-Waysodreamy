// Car object

void setup() {
  size(900, 600, P3D);
}

void draw() {
  background(40);
  lights();

  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.01);

  // ===== Car body =====
  fill(200, 0, 0);
  box(200, 40, 90);

  // ===== Wheels =====
  fill(40);
  drawWheel(-70, 25, -45);
  drawWheel( 70, 25, -45);
  drawWheel(-70, 25,  45);
  drawWheel( 70, 25,  45);
}

void drawWheel(float x, float y, float z) {
  float r = 20;    // radius
  float w = 14;    // width
  int detail = 24; // smoothness

  pushMatrix();
  translate(x, y, z);
  rotateZ(HALF_PI); // orient wheel correctly

  // Side of cylinder
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i <= detail; i++) {
    float a = TWO_PI * i / detail;
    float cx = cos(a) * r;
    float cy = sin(a) * r;
    vertex(cx, cy,  w/2);
    vertex(cx, cy, -w/2);
  }
  endShape();

  
// === Front cap ===
  beginShape(TRIANGLE_FAN);
  vertex(0, 0,  w/2); // center
  for (int i = 0; i <= detail; i++) {
    float a = TWO_PI * i / detail;
    vertex(cos(a) * r, sin(a) * r, w/2);
  }
  endShape();

  // === Back cap ===
  beginShape(TRIANGLE_FAN);
  vertex(0, 0, -w/2); // center
  for (int i = 0; i <= detail; i++) {
    float a = -TWO_PI * i / detail; // reverse winding
    vertex(cos(a) * r, sin(a) * r, -w/2);
  }
  endShape();

  popMatrix();
}
