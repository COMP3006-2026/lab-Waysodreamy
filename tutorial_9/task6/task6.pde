// Tutorial 9 - Q6
// Q4 Sun–Earth–Moon scene with PeasyCam

import peasy.*;

PeasyCam cam;

float earthAngle = 0;
float moonAngle  = 0;

// Textures
PImage sunImg, earthImg, moonImg;

// Textured sphere shapes
PShape sunShape, earthShape, moonShape;

void setup() {
  size(900, 700, P3D);
  textureMode(NORMAL);
  noStroke();

  // PeasyCam
  cam = new PeasyCam(this, 600);
  cam.setMinimumDistance(300);
  cam.setMaximumDistance(1200);

  // Load textures
  sunImg   = loadImage("sun.jpg");
  earthImg = loadImage("earth.jpg");
  moonImg  = loadImage("moon.jpg");

  // Create textured spheres
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

  // ----- Scene -----
  pushMatrix();

  // Sun
  rotateY(frameCount * 0.01);
  shape(sunShape);

  // Earth orbit
  rotateY(earthAngle);
  translate(250, 0);
  shape(earthShape);

  // Moon orbit
  rotateY(moonAngle);
  translate(80, 0);
  shape(moonShape);

  popMatrix();

  earthAngle += 0.01;
  moonAngle  += 0.04;
}
