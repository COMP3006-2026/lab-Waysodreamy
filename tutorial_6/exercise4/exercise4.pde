PImage img;

void setup() {
  size(600, 400);
  img = loadImage("test.png");
}

void draw() {
  background(255);
  img.loadPixels();

  int w = img.width;
  int h = img.height;

  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {

      int index = y * w + x;
      color c;

      // If pixel is in the last quarter (right side)
      if (x >= 3 * w / 4) {

        // Copy from first quarter
        int srcX = x - 3 * w / 4;
        int srcIndex = y * w + srcX;
        c = img.pixels[srcIndex];

      } else {
        // Otherwise, use original pixel
        c = img.pixels[index];
      }

      // Apply red tint
      img.pixels[index] = color(red(c), 0, 0);
    }
  }

  img.updatePixels();

  image(img, 0, 0);
}
