int r=(int)random(200,255);
int g=(int)random(200,255);
int b=(int)random(200,255);
  
void setup() {
  size(400, 400);
  smooth(4);
}

void draw() {
  background(250);

  // Center of the clock and basic radius
  float cx = width / 2.0;
  float cy = height / 2.0;
  float R  = min(width, height) * 0.42;

  // ----- Clock face -----
  noStroke();
  fill(155);
  ellipse(cx, cy, R * 2 + 16, R * 2 + 16); // outer rim
  stroke(0, 40);
  fill(r,g,b);
  strokeWeight(2);
  ellipse(cx, cy, R * 2, R * 2);           // main circle

  // Hour marks (12 ticks) + minute marks
  stroke(0);
  strokeWeight(3);
  for (int i = 0; i < 60; i++) {
    float ang = TWO_PI * i / 60.0 - HALF_PI; 
    float inner = (i % 5 == 0) ? R - 16 : R - 8; // longer tick every 5 minutes
    line(cx + inner * cos(ang), cy + inner * sin(ang),
         cx + (R - 2) * cos(ang), cy + (R - 2) * sin(ang));
  }

  // ----- Time -----
  int h = hour() % 12;
  int m = minute();
  int s = second();
  // Angles (radians). Subtract HALF_PI so 0 points up.
  float angHour = TWO_PI * (h + m / 60.0) / 12.0 - HALF_PI;
  float angMin  = TWO_PI * (m + s / 60.0) / 60.0 - HALF_PI;
  float angSec  = TWO_PI *  s / 60.0 - HALF_PI;

  // ----- Hands -----
  strokeCap(ROUND);
  // Hour hand
  stroke(30);
  strokeWeight(6);
  drawHand(cx, cy, angHour, R * 0.55);
  // Minute hand
  stroke(30);
  strokeWeight(4);
  drawHand(cx, cy, angMin, R * 0.78);
  // Second hand (red)
  stroke(220, 50, 50);
  strokeWeight(2);
  drawHand(cx, cy, angSec, R * 0.90);
  // Center cap
  noStroke();
  fill(0);
  ellipse(cx, cy, 8, 8);
}

// ---- Helper: draw a single hand given center, angle, and length ----
void drawHand(float cx, float cy, float ang, float len) {
  float x = cx + len * cos(ang);
  float y = cy + len * sin(ang);
  line(cx, cy, x, y);
}
