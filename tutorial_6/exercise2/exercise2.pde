PImage img;
PImage rotated;

void setup() {
  size(400, 400);
  img = loadImage("test.png");
  rotated = rotate90(img);
}

void draw() {
  background(0);

  image(rotated, 0, 0);

  rotated.loadPixels();

  // Highlight 50x50 region at mouse
  for (int y = mouseY; y < mouseY + 50; y++) {
    for (int x = mouseX; x < mouseX + 50; x++) {

      if (x >= 0 && x < rotated.width &&
          y >= 0 && y < rotated.height) {

        int index = y * rotated.width + x;
        color c = rotated.pixels[index];

        rotated.pixels[index] = color(
          min(red(c) + 10, 255),
          min(green(c) + 10, 255),
          min(blue(c) + 10, 255)
        );
      }
    }
  }

  rotated.updatePixels();
}

PImage rotate90(PImage src) {

  // New image with swapped width & height newW=h ; newH=w
  PImage dst = createImage(src.height, src.width, RGB);

  src.loadPixels();
  dst.loadPixels();

  for (int y = 0; y < src.height; y++) {
    for (int x = 0; x < src.width; x++) {

      int srcIndex = y * src.width + x;

      // Move pixel to new rotated position
      int newX = src.height - y - 1;
      int newY = x;
      int dstIndex = newY * dst.width + newX;

      dst.pixels[dstIndex] = src.pixels[srcIndex];
    }
  }

  dst.updatePixels();
  return dst;
}
