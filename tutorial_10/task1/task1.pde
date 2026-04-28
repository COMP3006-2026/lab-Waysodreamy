float x = 0;
float y = 0;
float z = 0;

void setup() {
  size(800, 600, P3D);
}

void draw() {
  background(200);
  lights();

  // Convert screen coordinates to world coordinates
  float targetX = mouseX - width / 2;
  float targetY = mouseY - height / 2;

  if (keyPressed && keyCode == SHIFT) {
    // Move along Z when SHIFT is held
    z += (mouseY - pmouseY);
  } else {
    // Always follow cursor in X/Y
    x = targetX;
    y = targetY;
  }

  translate(width / 2, height / 2);

  pushMatrix();
  translate(x, y, z);
  fill(150, 50, 250);
  noStroke();
  sphere(40);
  popMatrix();
}
