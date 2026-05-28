int earthFrameCount = 240;
int currentEarthFrame = 0;
PImage[] earth = new PImage[earthFrameCount];
PImage moonImg;

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
  
  // -----bonus-----
  /*
  if (sin(moonAngle)>0){
    drawEarth();
    drawMoonWithBlur();
  } 
  else
  {
    drawMoonWithBlur();
    drawEarth();
  }
  */
  
  drawEarth();
  drawMoonWithBlur();

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
    float y = earthY + moonOrbitRadius /** 0.2*/  * sin(a);

    image(moonImg, x, y, moonRadius*2, moonRadius*2);
  }

  // ---- draw current moon LAST (solid) ----
  noTint();
  float currentAngle = blurAngles[0];
  float cx = earthX + moonOrbitRadius * cos(currentAngle);
  float cy = earthY + moonOrbitRadius /** 0.2*/ * sin(currentAngle);

  image(moonImg, cx, cy, moonRadius*2, moonRadius*2);
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
}
