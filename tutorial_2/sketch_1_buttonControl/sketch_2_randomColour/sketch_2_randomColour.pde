int l;
int value = 0;
boolean button;
void setup(){
size(400,400);
l = 10;
button = false;
noStroke();
noLoop();
}
void draw(){
  while(value == 0){
    for(int y=0; y<height;y+=l){
      for(int x=0; x<width;x+=l){
        fill(random(0,255));
        rect(x+1,y+1,l,l);
      }
    }
  }
}

void mousePressed() {
  if (mouseX < width && mouseY < height){
    if (value == 0) value = 1; 
      else value = 0;
    println("PRESSED" + value);
  }
}
