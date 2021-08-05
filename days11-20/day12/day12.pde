// Poetical Computer Vision, day 12, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

PImage img;

void setup() {
  size(512, 512);
  img = loadImage("../../ada.jpg");
  noLoop();
  noStroke();
}

void draw() {
  image(img, 0, 0);
  blendMode(DIFFERENCE);
  
  int s = 64;
  for (int x = 0; x < width; x += s) {
    int i = (x/s)%2;
    for (int y = 0; y < height; y += s) {
      i++;
      if (random(1) < 0.5) {
        arc(x, y, s, s, 0, PI/2);
        arc(x+s, y+s, s, s, PI, 3*PI/2);
        if (i % 2 == 0) {
          square(x, y, s);
        }
      } else {
        arc(x+s, y, s, s, PI/2, PI);
        arc(x, y+s, s, s, 3*PI/2, 2*PI);
        if (i % 2 == 1) {
          square(x, y, s);
        }
      }
    }
  }
  
  save("result12.jpg");
}
