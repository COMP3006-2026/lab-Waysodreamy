class MyShape {
  int id;         
  int posX, posY, radius;
  color r, g, b;

  MyShape(int id, int radius) {
    this.id = id;
    this.radius = radius;
    this.r = (int)random(255);
    this.g = (int)random(255);
    this.b = (int)random(255);
    posX = (int)random(100, 500);
    posY = (int)random(100, 500);
  }

  void move(int dx, int dy) {
    posX += dx;
    posY += dy;
  }

  void drawShape(boolean selected) {
    noStroke();
    fill(r, g, b);
    ellipse(posX, posY, radius * 2, radius * 2);

    // Outline for selected object
    if (selected) {
      stroke(0);
      strokeWeight(3);
      noFill();
      ellipse(posX, posY, radius * 2 + 8, radius * 2 + 8);
    }

    // draw the object idx
    fill(0);
    noStroke();
    text(str(id), posX, posY);
  }
}
