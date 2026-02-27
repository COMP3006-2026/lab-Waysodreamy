//--------------------------------------------EXERCISE 8
// draw the equation y=1-x^4

void setup() {
  size(400, 400);
  smooth(8);
  drawBackgroundGrid();  // background design
  drawFunction();        // plot the curve
}

void drawBackgroundGrid() {
  background(248);
  strokeWeight(1);

  // Major grid every 50 px
  stroke(200);
  for (int x = 0; x <= width; x += 50) line(x, 0, x, height);
  for (int y = 0; y <= height; y += 50) line(0, y, width, y);

  // Minor grid every 10 px (lighter)
  stroke(235);
  for (int x = 0; x <= width; x += 10) line(x, 0, x, height);
  for (int y = 0; y <= height; y += 10) line(0, y, width, y);

  // Soft border
  noFill();
  stroke(0, 25);
  rect(5, 5, width-10, height-10);
}

void drawFunction() {
  noFill();
  strokeWeight(2);
  stroke(random(255),random(255),random(255));
  beginShape();
  for (int x = 0; x < width; x++) {
  float n = norm(x, 0.0, float(width)); // range 0.0 to 1.0
  float y = 1-pow(n, 4); // calculate curve
  y = y*width; // range 0.0 to width
  vertex(x, y);
  }
endShape();
}
