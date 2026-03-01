size(400,400);
//--------------------------------------------EXERCISE 4
// draw the equation y=1-x^4
noFill();
strokeWeight(2);
beginShape();
for (int x = 0; x < width; x++) {
float n = norm(x, 0.0, float(width)); // range 0.0 to 1.0
float y = 1-pow(n, 4); // calculate curve
y = y*width; // range 0.0 to width
vertex(x, y);
}
endShape();
