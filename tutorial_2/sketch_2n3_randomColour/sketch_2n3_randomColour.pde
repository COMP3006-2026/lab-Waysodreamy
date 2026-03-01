int l;
int value = 0;
boolean loop;
void setup(){
size(400,400);
l = 10;
loop=true;
noStroke();
//noLoop();
}
void draw(){
  
  if(loop){
    //====================== For Loop
    for(int y=0; y<height;y+=l){
      for(int x=0; x<width;x+=l){
        fill(random(0,255));
        rect(x+1,y+1,l,l);
      }
    //====================== While Loop
    
    //int y = 0;
    //  while (y < height){
    //    int x = 0;
    //    while (x < width){
    //      fill (random(0,255));
    //      rect(x+1,y+1,l,l);
    //      x+=l;
    //    }
    //    y+=l;
      //} 
    }//when testing for loop, don't turn this line into comment
  }
}


void mousePressed() {
  if (mouseX < width && mouseY < height){
    loop = !loop;
    println("PRESSED");
  }
}
