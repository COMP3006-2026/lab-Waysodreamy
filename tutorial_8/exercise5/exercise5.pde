import peasy.*;

PeasyCam cam;

// Graphics buffer
PGraphics pg;

// Animation variables
float moonAngle = 0;          // orbit angle
float earthRadius = 100;
float moonRadius  = 40;
//shuttle's movement
float shuttleProgress = 0;    // 0 -> Earth, 1 -> Moon
float shuttleSpeed = 0.0028;   // flight speed


void setup(){
  size(1000, 1000, P3D);

  pg = createGraphics(1000, 1000, P3D);

  // PeasyCam setup
  cam = new PeasyCam(this, pg, 800);
  cam.setMinimumDistance(300);
  cam.setMaximumDistance(2000);


}

void draw(){
  pg.beginDraw();
  pg.background(40);

  pg.ambientLight(80, 80, 80);
  pg.directionalLight(255, 255, 255, -150, 150, -80);

  // ===== Earth =====
  pg.pushMatrix();
  pg.fill(0, 100, 255);
  pg.noStroke();
  pg.sphere(earthRadius);
  pg.popMatrix();

  // ===== Moon Orbit =====
  pg.pushMatrix();
  pg.rotateY(moonAngle);
  pg.translate(0, 0, 420);
  pg.fill(180);
  pg.noStroke();
  pg.sphere(moonRadius);
  pg.popMatrix();

  moonAngle += radians(1);
  
  
// ===== Shuttle =====
  if (shuttleProgress < 1.0) {
  pg.pushMatrix();

  float shuttleZ = lerp(0, 420, shuttleProgress);
  pg.translate(0, 0, shuttleZ);
  pg.fill(220, 220, 255);
  pg.box(40, 40, 80);

  pg.popMatrix();
}

  shuttleProgress += shuttleSpeed;
  shuttleProgress = constrain(shuttleProgress, 0, 1);

  pg.endDraw();

  cam.getState().apply(pg);
  image(pg, 0, 0);
}
