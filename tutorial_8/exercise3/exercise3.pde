// Rotate a pentagon around with PeasyCam
import peasy.*;
PeasyCam cam;
void setup() {
  size(400, 400, P3D);
  cam = new PeasyCam(this, 300); // distance from scene
  fill(204);
  noStroke();
}
void draw() {
background(0);
beginShape();
vertex(0,0);
vertex(0,100);
vertex(100,200);
vertex(200,100);
vertex(200,0);
endShape();
stroke(255);
}
