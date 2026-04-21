// Room + table + chair with brick + textures

import shapes3d.*;
import shapes3d.utils.*;
import peasy.*;

PeasyCam cam;
ShapeGroup scene;

// Textures
PImage brickTex, woodTex;

void setup() {
  size(900, 700, P3D);

  cam = new PeasyCam(this, 600);
  cam.setMinimumDistance(300);
  cam.setMaximumDistance(1200);

  brickTex = loadImage("brick.jpg");
  woodTex  = loadImage("wood.jpg");

  scene = new ShapeGroup();

  // ---------- ROOM ----------
  float floorY = 150;
  float floorThickness = 20;
  float floorTopY = floorY - floorThickness / 2;

  // Floor
  Box floor = new Box(600, floorThickness, 600);
  floor.texture(brickTex);
  floor.drawMode(Shape3D.TEXTURE);
  floor.moveTo(0, floorY, 0);
  scene.addChild(floor);

  // Back wall
  Box backWall = new Box(600, 300, 20);
  backWall.texture(brickTex);
  backWall.drawMode(Shape3D.TEXTURE);
  backWall.moveTo(0, floorY - 150, -300);
  scene.addChild(backWall);

  // Left wall
  Box leftWall = new Box(20, 300, 600);
  leftWall.texture(brickTex);
  leftWall.drawMode(Shape3D.TEXTURE);
  leftWall.moveTo(-300, floorY - 150, 0);
  scene.addChild(leftWall);

  // Right wall
  Box rightWall = new Box(20, 300, 600);
  rightWall.texture(brickTex);
  rightWall.drawMode(Shape3D.TEXTURE);
  rightWall.moveTo(300, floorY - 150, 0);
  scene.addChild(rightWall);

  // ---------- POSITIONS ----------
  float tableZ = 120;   // closer to camera
  float chairZ = -40;   // behind table

  // ---------- TABLE ----------
  float tableLegHeight = 100;
  float tableTopHeight = 15;

  float tableLegY = floorTopY - tableLegHeight / 2;
  float tableTopY = tableLegY - tableLegHeight / 2 - tableTopHeight / 2;

  Box tableTop = new Box(200, tableTopHeight, 120);
  tableTop.texture(woodTex);
  tableTop.drawMode(Shape3D.TEXTURE);
  tableTop.moveTo(0, tableTopY, tableZ);
  scene.addChild(tableTop);

  for (int x : new int[]{-90, 90}) {
    for (int z : new int[]{-50, 50}) {
      Box leg = new Box(15, tableLegHeight, 15);
      leg.texture(woodTex);
      leg.drawMode(Shape3D.TEXTURE);
      leg.moveTo(x, tableLegY, z + tableZ);
      scene.addChild(leg);
    }
  }

  // ---------- CHAIR ----------
  float chairLegHeight = 90;
  float chairSeatHeight = 15;

  float chairLegY = floorTopY - chairLegHeight / 2;
  float chairSeatY = chairLegY - chairLegHeight / 2 - chairSeatHeight / 2;

  Box chairSeat = new Box(80, chairSeatHeight, 80);
  chairSeat.texture(woodTex);
  chairSeat.drawMode(Shape3D.TEXTURE);
  chairSeat.moveTo(0, chairSeatY, chairZ);
  scene.addChild(chairSeat);

  Box chairBack = new Box(80, 80, 10);
  chairBack.texture(woodTex);
  chairBack.drawMode(Shape3D.TEXTURE);
  chairBack.moveTo(0, chairSeatY - 40, chairZ - 35);
  scene.addChild(chairBack);

  for (int x : new int[]{-35, 35}) {
    for (int z : new int[]{-35, 35}) {
      Box leg = new Box(12, chairLegHeight, 12);
      leg.texture(woodTex);
      leg.drawMode(Shape3D.TEXTURE);
      leg.moveTo(x, chairLegY, z + chairZ);
      scene.addChild(leg);
    }
  }
}

void draw() {
  background(120);
  lights();
  scene.draw(g);
}
