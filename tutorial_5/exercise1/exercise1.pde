MyShape[] objs;
int numObjs = 2; //can be any number of objects       
int chosen = 0;         

// --- Setup ---
void setup() {
  size(600, 600);
  objs = new MyShape[numObjs];
  for (int i = 0; i < numObjs; i++) {
    int radius = (int)random(20, 70);
    objs[i] = new MyShape(i + 1, radius);  // id is 1-based
  }
  textAlign(CENTER, CENTER);
  textSize(14);
}

void draw() {
  background(255);

  for (int i = 0; i < numObjs; i++) {
    boolean isSelected = (i == chosen);
    objs[i].drawShape(isSelected);
  }

  fill(0);
  noStroke();
  text("Press number keys (1.." + numObjs + ") to select. Use arrow keys to move.", width/2, 20);
}

void keyPressed() {
  if (key >= '1' && key <= '9') {
    int requested = key - '1';      // '1' -> 0, '2' -> 1, etc.
    if (requested >= 0 && requested < numObjs) {
      chosen = requested;
    }
  }

  if (keyCode == RIGHT)  objs[chosen].move(5, 0);
  if (keyCode == LEFT)   objs[chosen].move(-5, 0);
  if (keyCode == UP)     objs[chosen].move(0, -5);
  if (keyCode == DOWN)   objs[chosen].move(0, 5);
}
