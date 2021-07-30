// Portraits, day 30, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

PImage img;

void setup() {
  size(512, 512);
  img = loadImage("../ada.jpg");
  noLoop();
}

void draw() {
  background(0);
  blendMode(DIFFERENCE);
  
  for (float i = 0; i < 1; i += 0.15) {
    PImage copy = smoothFilter(i, 5);
    image(copy, 0, 0);
  }
  
  save("result30.jpg");
}

PImage smoothFilter(float thresh, float blu) {
  PImage copy = img.get(0, 0, img.width, img.height);
  copy.filter(THRESHOLD, thresh);
  copy.filter(BLUR, blu);
  copy.filter(THRESHOLD, 0.5);
  return copy;
}
