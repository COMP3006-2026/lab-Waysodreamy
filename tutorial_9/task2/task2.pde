// Random Attributes

void setup() {
  size(600, 600, P3D);
}

void draw() {
  noLoop();
  background(200);
  lights();

  for (int i = 0; i < 10; i++) {
    pushMatrix();
    translate(random(width/6,width-(width/6)),random(height/6,width-(width/6)),random(-300, 300));

    // Random colour
    int c = int(random(3));
    if (c == 0) fill(255, 0, 0);
    else if (c == 1) fill(0, 255, 0);
    else fill(0, 0, 255);

    // Random fill / stroke
    if (random(1) < 0.5) noFill();
    if (random(1) < 0.5) noStroke();
    else stroke(0);

    if (random(1) < 0.5)
      box(random(30, 70));
    else
      sphere(random(20, 40));

    popMatrix();
  }
}
