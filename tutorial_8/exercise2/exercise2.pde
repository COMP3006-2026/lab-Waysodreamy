// Rotate a pentagon around the y-axis and x-axis with P3D
void setup() {
size(400, 400, P3D);
fill(204);
}
void draw() {
background(0);
translate(width/2, height/2, -width);
rotateY(map(mouseX, 0, width, -PI, PI));
rotateX(map(mouseY, 0, height, -PI, PI));
noStroke();
beginShape();
vertex(0,0);
vertex(0,100);
vertex(100,200);
vertex(200,100);
vertex(200,0);
endShape();
stroke(255);
}
