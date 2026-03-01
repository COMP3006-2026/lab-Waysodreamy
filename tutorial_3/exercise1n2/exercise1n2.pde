size(400,400);

//-------------------------------------------EXERCISE 1
//Drawing AxA grid
int gridSize=3;
int cellSize=20;
for (int r=0; r<gridSize;r++){
  for (int c=0; c<gridSize;c++){
    beginShape();
    vertex(c*cellSize,r*cellSize);
    vertex((c+1)*cellSize,r*cellSize);
    vertex((c+1)*cellSize,(r+1)*cellSize);
    vertex(c*cellSize,(r+1)*cellSize);
    endShape(CLOSE);
  }
}

//-------------------------------------------EXERCISE 2
// drawing Spike
int baseY = 200;
int pointY = 100;
int spikeTotal=10;
noStroke();
beginShape(TRIANGLES);
for (int i=0;i<spikeTotal;i++){
vertex(width/(spikeTotal+2)*(i+1),baseY);
vertex(width/(spikeTotal+2)*(i+1.5),pointY);
vertex(width/(spikeTotal+2)*(i+2),baseY);
}
endShape();

beginShape();
vertex(width/width, baseY);
vertex(width/(spikeTotal), pointY+(pointY/1.7));
vertex(width-(width/spikeTotal+4), pointY+(pointY/1.7));
vertex(width, baseY);
endShape(CLOSE);
