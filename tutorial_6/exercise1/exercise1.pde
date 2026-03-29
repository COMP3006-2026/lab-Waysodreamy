PImage img;
PGraphics flipped;

void setup() {
  size(600, 400);
  img = loadImage("test.png");

  // Create flipped version once
  flipped = createGraphics(width, height);
  flipped.beginDraw();
  flipped.translate(width, 0);
  flipped.scale(-1, 1);
  flipped.image(img, 0, 0, width, height);
  flipped.endDraw();
}

void draw() {
  background(0);

  // Draw normal image
  image(img, 0, 0, width, height);

  // Reveal flipped image to the right of split
  copy(flipped,
       mouseX, 0, width - mouseX, height,
       mouseX, 0, width - mouseX, height);

  // Draw visible split line
  stroke(255, 0, 0);
  strokeWeight(3);
  line(mouseX, 0, mouseX, height);
}
