
PImage[] earth;
PImage moonImg;
int earthFrameCount = 240;
int currentEarthFrame = 0;

// ---------- EARTH & MOON ----------
float earthX, earthY;
float earthRadius = 80;
float moonRadius = 20;
float moonOrbitRadius = 180;
float moonAngle = 0;
float moonSpeed = 0.01;

// Exercise 2: Motion blur
float[] blurAngles;
int blurLength = 5;

// ---------- SHUTTLE ----------
float t = 0;              // 0 → 1
float tSpeed = 0.003;
boolean shuttleActive = true;

// =====================================================

void setup() {
  size(600, 600);
  smooth();

  earthX = width / 2;
  earthY = height / 2;

  // ---- Load Earth GIF Frames ----
  earth = new PImage[earthFrameCount];
  for (int i = 0; i < earthFrameCount; i++) {
    earth[i] = loadImage("earth/" + i + ".gif");
  }

  // ---- Load Moon Image ----
  moonImg = loadImage("moon.png");

  // ---- Blur Buffer ----
  blurAngles = new float[blurLength];
}

// =====================================================

void draw() {
  background(0);

  drawEarth();
  drawMoonWithBlur();
  drawShuttle();

  updateAnimation();
}

// EARTH (GIF ROTATION)
// =====================================================
void drawEarth() {
  imageMode(CENTER);
  image(earth[currentEarthFrame], earthX, earthY, earthRadius*2, earthRadius*2);
}

// MOON ORBIT + MOTION BLUR
// =====================================================
void drawMoonWithBlur() {
  imageMode(CENTER);

  // ---- draw blurred trail (OLD → faint) ----
  for (int i = blurLength - 1; i > 0; i--) {
    float alpha = map(i, 0, blurLength, 40, 160);
    tint(255, alpha);

    float a = blurAngles[i];
    float x = earthX + moonOrbitRadius * cos(a);
    float y = earthY + moonOrbitRadius * sin(a);

    image(moonImg, x, y, moonRadius*2, moonRadius*2);
  }

  // ---- draw current moon LAST (solid) ----
  noTint();
  float currentAngle = blurAngles[0];
  float cx = earthX + moonOrbitRadius * cos(currentAngle);
  float cy = earthY + moonOrbitRadius * sin(currentAngle);

  image(moonImg, cx, cy, moonRadius*2, moonRadius*2);
 }
// =====================================================
// SPACE SHUTTLE (EASE IN → OUT)
// =====================================================
void drawShuttle() {
  if (!shuttleActive) return;

  // Ease-in / Ease-out function
  float s = 3*t*t - 2*t*t*t;

  float moonX = earthX + moonOrbitRadius * cos(moonAngle);
  float moonY = earthY + moonOrbitRadius * sin(moonAngle);

  float x = lerp(earthX, moonX, s);
  float y = lerp(earthY, moonY, s);

  pushMatrix();
  translate(x, y);

  fill(255, 200, 50);
  stroke(255);
  strokeWeight(1);

  // Simple polygon shuttle
  beginShape();
  vertex(-8, -5);
  vertex(10, 0);
  vertex(-8, 5);
  endShape(CLOSE);

  popMatrix();
}

// =====================================================
// UPDATE ANIMATION PER FRAME
// =====================================================
void updateAnimation() {
  // Earth GIF animation
  currentEarthFrame = (currentEarthFrame + 1) % earthFrameCount;

  // Moon orbit update
  moonAngle += moonSpeed;

  // Update blur buffer
  for (int i = blurLength - 1; i > 0; i--) {
    blurAngles[i] = blurAngles[i - 1];
  }
  blurAngles[0] = moonAngle;

  // Shuttle time
  if (shuttleActive) {
    t += tSpeed;
    if (t >= 1) {
      t = 1;
      shuttleActive = false;
    }
  }
}
