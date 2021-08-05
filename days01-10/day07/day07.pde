// Poetical Computer Vision, day 7, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

PImage img;

void setup() {
  size(512, 512);
  img = loadImage("../../ada.jpg");
  noStroke();
  noLoop();
}

void draw() {
  //image(img, 0, 0);
  
  for (int x = 0; x < width; x += 1) {
    for (int y = 0; y < height; y += 1) {
      int offset = int(sin(2*TWO_PI*y/height)*32);
      color c1 = img.get((x-offset+width)%width, y);
      color c2 = img.get(x, y);
      color c3 = img.get((x+offset+width)%width, y);
      fill(red(c1), green(c2), blue(c3));
      rect(x, y, 1, 1);
    }
  }
  
  save("result07.jpg");
}
