MyShape [] objs;
int numObjs = 2; //can be any number of objects
int pickedItem = -1;

void setup() {
  size(600, 600);  
  textAlign(CENTER, CENTER);
  textSize(16);
  objs = new MyShape[numObjs];  
  for (int i = 0; i < numObjs; i++) {
    int radius = (int)(random(20, 70));
    color c = 255;
    objs[i] = new MyShape(radius,c);
  }
}

void draw() { 
  background(255);
  for (int i = 0; i < numObjs; i++) {
    objs[i].drawShape();
  }
  fill(0);
  text("Dragged any shape to move it!", width/2, 30);
}  

// return the index number of the picked item from the array
// return -1 otherwise
int getPickedObj(int x, int y) {
  for (int i = 0; i < numObjs; i++) {
    if (objs[i].isOnShape(x, y)) {
      return i;
    }
  }
  return -1;
}

void mousePressed() {
  pickedItem = getPickedObj(mouseX, mouseY);
}
  
void mouseDragged() {
  if (pickedItem >= 0) {
    objs[pickedItem].move(mouseX, mouseY);
    objs[pickedItem].drawShape();
  }
}
