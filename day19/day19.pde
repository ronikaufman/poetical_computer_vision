// Portraits, day 19, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

PImage img;

void setup() {
  size(512, 512);
  img = loadImage("../ada.jpg");
  noLoop();
  noStroke();
  fill(0);
}

void draw() {
  background(255);
  
  int s = 8;
  float minD = 1;
  float maxD = 12;
  
  int x = s/2;
  int y = s/2;
  while (y < height) {
    while (x < width) {
      float v = brightness(img.get(x, y));
      float d = map(v, 0, 255, maxD, minD);
      circle(x, y, d);
      
      x += 2*s;
    }
    y += s;
    x = (x+s)%width-2*s;
  }
  
  save("result19.jpg");
}
