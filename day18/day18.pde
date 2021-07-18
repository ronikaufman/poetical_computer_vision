// Portraits, day 18, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

// Floyd-Steinberg dithering
// https://surma.dev/things/ditherpunk/

PImage img;

void setup() {
  size(512, 512);
  img = loadImage("../ada.jpg");
  noLoop();
  noStroke();
}

void draw() {
  img.filter(GRAY);
  image(img, 0, 0);
  
  loadPixels();
  for (int i = 0; i < width*height; i++) {
    float v = red(pixels[i]);
    float error;
    if (v > 128) {
      pixels[i] = color(255);
      error = v-255;
    } else {
      pixels[i] = color(0);
      error = v;
    }
    if ((i+1) % width != 0) {
      // (x+1, y)
      pixels[i+1] = color(red(pixels[i+1]) + error*7/16);
    }
    if (i < width*height - width) {
      if (i % width != 0) {
        // (x-1, y+1)
        pixels[i-1+width] = color(red(pixels[i-1+width]) + error*3/16);
      }
      // (x, y+1)
      pixels[i+width] = color(red(pixels[i+width]) + error*5/16);
      if ((i+1) % width != 0) {
        // (x+1, y+1)
        pixels[i+1+width] = color(red(pixels[i+1+width]) + error*1/16);
      }
    }
  }
  updatePixels();
  
  save("result18.jpg");
}
