// Random Spheres and Boxes

void setup() {
  size(600, 600, P3D);
  noStroke();
}

void draw() {
  noLoop();
  background(220);
  lights();

  for (int i = 0; i < 10; i++) {
    pushMatrix();
    translate(random(width/6,width-(width/6)),random(height/6,width-(width/6)),random(-300, 300));

    if (random(1) < 0.5) {
      box(random(30, 80));
    } else {
      sphere(random(20, 50));
    }
    popMatrix();
  }
}
