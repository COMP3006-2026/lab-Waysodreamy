void setup(){
  size(400,400);
  background(255);
  smooth();
}
void draw()
{
rectMode(CENTER);
if (mouseY > 50 && mouseY < 150 && mouseX >50 && mouseX < 150) {
    fill(255, 0, 0);  // red colour
    rect(100,100,100,50);
    }  else{
        fill(150);
        rect(100,100,100,50);
      }
if (mouseY > 150 && mouseY < 250 && mouseX >50 && mouseX < 150) {
    fill(0, 255, 0);  // blue colour
    rect(100,200,100,50);
    }  else{
        fill(150);
        rect(100,200,100,50);
      }
if (mouseY > 250 && mouseY < 350 && mouseX >50 && mouseX < 150){
    fill(0, 0, 255);  // green colour
    rect(100,300,100,50);
    }  else{
        fill(150);
        rect(100,300,100,50);
      }     
}
