// Poetical Computer Vision, day 2, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

PImage img;

void setup() {
  size(512, 512);
  img = loadImage("../../ada.jpg");
  noStroke();
}

void draw() {
  //image(img, 0, 0);
  int s = 1;
  
  for (int x = 0; x < width; x += s) {
    for (int y = 0; y < height; y += s) {
      color c = img.get(x, y);
      float r = map(x, 0, width, red(c), 255-red(c));
      float g = map(y, 0, width, green(c), 255-green(c));
      float b = map(x+y, width+height, 0, blue(c), 255-blue(c));
      fill(r, g, b);
      rect(x, y, s, s);
    }
  }
  
  save("result02.jpg");
}
