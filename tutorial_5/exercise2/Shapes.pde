// a shape is simply as a circle
class MyShape {
  int posX, posY, radius;
  color r,g,b;
  
  MyShape(int radius, int c) {
    this.radius = radius;
    this.r = (int)random(c);
    this.g = (int)random(c);
    this.b = (int)random(c);
    posX = (int)random(100, 300);
    posY = (int)random(100, 300);
  }
  
  // return true if the position x, y is on the shape
  boolean isOnShape(int x, int y) {
    float d = (posX - x)*(posX - x) + (posY - y)*(posY - y);
    d = sqrt(d);
    if (d < radius)  return true;
    else             return false; 
  }
  
  void move (int newPosX, int newPosY) {
    this.posX = newPosX;
    this.posY = newPosY;
  }
  
  void drawShape() {
    noStroke();
    fill(r,g,b);
    ellipse(posX, posY, 2*radius, 2*radius);
  }
}
