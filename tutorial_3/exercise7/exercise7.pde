//------------------------------------------EXERCISE 7
void setup() {
  size(400, 400);
  noStroke();
  //Cloud texture 
  noiseSeed(1337);          // try changing the seed number
  float scale1 = 0.02;      // noise frequency (smaller = smoother)
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width/2; x++) {
      float n = noise(x * scale1, y * scale1); // 0..1
      float gray = n * 255;
      fill(gray);
      rect(x, y, 1, 1);
    }
  }

  //RINGS disturbed by noise
  noiseSeed(98765);
  float cx = width * 0.75;   // center x for right panel
  float cy = height * 0.5;   // center y
  float scale2 = 0.03;       // noise frequency
  for (int y = 0; y < height; y++) {
    for (int x = width/2; x < width; x++) {
      float dx = x - cx;
      float dy = y - cy;
      float d = sqrt(dx*dx + dy*dy);          // distance from center
      float wobble = noise(x * scale2, y * scale2); // 0..1
      float rings = sin(0.15 * d + 6 * wobble);     // ring pattern with noise
      float gray = map(rings, -1, 1, 30, 230);
      fill(gray);
      rect(x, y, 1, 1);
    }
  }
}
