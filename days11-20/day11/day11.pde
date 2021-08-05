// Poetical Computer Vision, day 11, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

PImage img;
int n = 6;

void setup() {
  size(512, 512);
  img = loadImage("../../ada.jpg");
  noLoop();
}

void draw() {
  recurse(0, 0, width, n);
  
  save("result11.jpg");
}

void recurse(float x, float y, float s, int n) {
  if (n == 0) {
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        image(img, x+i*s/4, y+j*s/4, s/4, s/4);
      }
    }
    return;
  }
  
  for (int i = 0; i < 4; i++) {
    image(img, x, y+i*s/4, s/4, s/4);
    image(img, x+3*s/4, y+i*s/4, s/4, s/4);
    if ((i == 1) || (i == 2)) {
      image(img, x+i*s/4, y, s/4, s/4);
      image(img, x+i*s/4, y+3*s/4, s/4, s/4);
    }
  }

  recurse(x+s/4, y+s/4, s/2, n-1);
}
