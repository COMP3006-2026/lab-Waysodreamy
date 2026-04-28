// 5 car objects
Car[] cars = new Car[5];
int selected = -1;

void setup() {
  size(1200, 600, P3D);

  for (int i = 0; i < cars.length; i++) {
    cars[i] = new Car();
    cars[i].pos.x = (i - 2) * 260;
    cars[i].scaleFactor = random(0.3,0.6);
    cars[i].bodyColor = color(random(100,255),random(100,255),random(100,255));
  }
}

void draw() {
  background(200);
  lights();
  translate(width/2, height/2);

  for (int i = 0; i < cars.length; i++) {
    cars[i].drawCar();
  }
}
