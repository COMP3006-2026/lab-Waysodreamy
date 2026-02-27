//---------------------------------------------EXERCISE 6
void setup() {
  size(400, 400);
  background(255);
  noStroke();

  int count = 100;
  for (int i = 0; i < count; i++) {
    float r = random(5, 30);          // random radius
    float gray = random(20, 230);     // random gray (0=black, 255=white)
    fill(gray);

    // Place circle fully inside the canvas (avoid clipping)
    float x = random(r, width - r);
    float y = random(r, height - r);

    circle(x, y, 2*r);
  }
}
