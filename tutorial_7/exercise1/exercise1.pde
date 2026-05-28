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

// =====================================================

void setup() {
  size(600, 600);
  smooth();

  earthX = width / 2;
  earthY = height / 2;

  // ---- Load Earth GIF Frames ----
  for (int i = 0; i < earthFrameCount; i++) {
    earth[i] = loadImage("earth/" + i + ".gif");
  }

  // ---- Load Moon Image ----
  moonImg = loadImage("moon.png");

}

// =====================================================

void draw() {
  background(0);
  
  // -----bonus-----
  /*
  if (sin(moonAngle)>0){
    drawEarth();
    drawMoon();
  } 
  else
  {
    drawMoon();
    drawEarth();
  }
  */
  drawEarth();
  drawMoon();

  updateAnimation();
}

// EARTH (GIF ROTATION)
// =====================================================
void drawEarth() {
  imageMode(CENTER);
  image(earth[currentEarthFrame], earthX, earthY, earthRadius*2, earthRadius*2);
}

// MOON ORBIT
// =====================================================
void drawMoon() {
  imageMode(CENTER);

  // ---- draw moon(solid) ----
  float cx = earthX + moonOrbitRadius * cos(moonAngle);
  float cy = earthY + moonOrbitRadius /** 0.2*/ * sin(moonAngle);
  
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
}
