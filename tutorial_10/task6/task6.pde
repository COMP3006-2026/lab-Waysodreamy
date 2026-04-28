// Movement + rotation + scaling + fading

Car[] cars = new Car[6];

void setup() {
  size(600, 600, P3D);
  for (int i = 0; i < cars.length; i++) {
    cars[i] = new Car();
    cars[i].pos.x = (i - 2) * 260;
    cars[i].bodyColor = color(random(100,255),random(100,255),random(100,255));
  }
}

void draw() {
  background(200);
  lights();
  
  translate(width/2, height/2);

  float t = frameCount * 0.02;

  for (int i = 0; i < cars.length; i++) {
    Car c = cars[i];

    c.pos.x = cos(t + i) * 400;
    c.pos.z = sin(t + i) * 300;

    if (i == 1) c.rotY += 0.03;
    if (i == 2) c.scaleFactor = map(sin(t), -1, 1, 0.5, 1.5);
    if (i == 3) c.alpha = map(sin(t), -1, 1, 50, 255);
    if (i == 5) c.bodyColor = color(random(100,200),random(100,200),random(100,200));

    c.drawCar();
  }
}
