PImage img, copied;
int x1, y1, x2, y2;
int pasteX, pasteY;

boolean selecting = false;
boolean hasCopy = false;
boolean shouldPaste = false;

void setup() {
  size(600, 400);
  img = loadImage("test.png");
}

void draw() {
  background(255);
  image(img, 0, 0);

  // Draw pasted copy
  if (shouldPaste && copied != null) {
    image(copied, pasteX, pasteY);
  }
  
  // Draw selection rectangle
  if (selecting) {
    noFill();
    stroke(255, 0, 0);
    rect(x1, y1, mouseX - x1, mouseY - y1);
  }
  
  fill(0);
  textSize(12);
  textAlign(RIGHT, BOTTOM);

  text("Copy & Paste:\n 1. Click Destination Point(where should be pasted)\n 2. Select area to be copied", width - 10, height - 10);

}

void mousePressed() {
  x1 = mouseX;
  y1 = mouseY;
  selecting = true;
}

void mouseReleased() {
  x2 = mouseX;
  y2 = mouseY;
  selecting = false;

  int sx = min(x1, x2);
  int sy = min(y1, y2);
  int w = abs(x2 - x1);
  int h = abs(y2 - y1);

  copied = img.get(sx, sy, w, h);
  hasCopy = true;
}

void mouseClicked() {
  if (hasCopy) {
    pasteX = mouseX;
    pasteY = mouseY;
    shouldPaste = true;
  }
}
