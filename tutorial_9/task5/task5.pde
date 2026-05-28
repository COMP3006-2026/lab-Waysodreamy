// Tutorial 9 - Q5
// Static top/bottom camera (no spinning)

float earthAngle = 0;
float moonAngle  = 0;

// Camera control
float camAngle = radians(179);  // change value manually
float radius   = 600;

// Textures
PImage sunImg, earthImg, moonImg;
PShape sunShape, earthShape, moonShape;

void setup() {
  size(900, 700, P3D);
  textureMode(NORMAL);
  noStroke();

  sunImg   = loadImage("sun.jpg");
  earthImg = loadImage("earth.jpg");
  moonImg  = loadImage("moon.jpg");

  sunShape   = createShape(SPHERE, 100);
  sunShape.setTexture(sunImg);

  earthShape = createShape(SPHERE, 40);
  earthShape.setTexture(earthImg);

  moonShape  = createShape(SPHERE, 15);
  moonShape.setTexture(moonImg);
}

void draw() {
  background(0);
  lights();

  // ----- STATIC camera (no animation) -----
  float camX = 0;
  float camY = cos(camAngle) * radius;
  float camZ = sin(camAngle) * radius;

  camera(
    camX, camY, camZ,
    0, 0, 0,
    0, 1, 0
  );

  // ----- Q4 scene -----
  pushMatrix();

  rotateY(frameCount * 0.01);
  shape(sunShape);

  rotateY(earthAngle);
  translate(250, 0);
  shape(earthShape);

  rotateY(moonAngle);
  translate(80, 0);
  shape(moonShape);

  popMatrix();

  earthAngle += 0.01;
  moonAngle  += 0.04;
}
