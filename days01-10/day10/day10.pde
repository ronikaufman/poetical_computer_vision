// Poetical Computer Vision, day 10, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

PImage img;
int n = 5;

void setup() {
  size(512, 512);
  img = loadImage("../../ada.jpg");
  noStroke();
  noLoop();
}

void draw() {
  float s = width/(2*(pow(2, n-2)-1)+pow(2, n));
  float offset = 1e-12;
  for (int i = 1; i < n; i++) {
    for (float x = offset; x < width - offset - s; x += s) {
      image(img, x, offset, s, s);
      image(img, width-offset-s, x, s, s);
      image(img, width-s-x, width-s-offset, s, s);
      image(img, offset, width-s-x, s, s);
    }
    offset += s;
    s *= 2.;
  }
  image(img, offset, offset, s, s);
  
  save("result10.jpg");
}
