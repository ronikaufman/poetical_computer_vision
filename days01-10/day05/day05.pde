// Portraits, day 5, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

PImage img;

void setup() {
  size(512, 512);
  img = loadImage("../../ada.jpg");
  noStroke();
  noLoop();
  colorMode(HSB, 255);
}

void draw() {
  //image(img, 0, 0);
  
  float max_d = distSquared(0, 0, width/2, height/2);
  
  for (int x = 0; x < width; x += 1) {
    for (int y = 0; y < height; y += 1) {
      color c = img.get(x, y);
      float gray = red(c)*0.299 + green(c)*0.587 + blue(c)*0.114;
      float d = distSquared(x, y, width/2, height/2);
      float hue = map(d, 0, max_d, gray, gray+255)%255;
      fill(hue, 255, 255);
      rect(x, y, 1, 1);
    }
  }
  
  save("result05.jpg");
}

float distSquared(int x1, int y1, int x2, int y2) {
  return sq(x1-x2) + sq(y1-y2);
}
