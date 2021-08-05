// Poetical Computer Vision, day 6, July 2021
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
  
  int disp = 8;
  
  for (int y = 0; y < height; y += 1) {
    for (int x = 0; x < width; x += 1) {
      if (y%64 == 0) {
        disp = int(random(-64, 64));
      }
      color c1 = img.get(x, y);
      color c2 = img.get((x-disp+width)%width, y);
      color c3 = img.get(x, (y-disp+height)%height);
      fill(red(c1), green(c2), blue(c3));
      rect(x, y, 1, 1);
    }
  }
  
  save("result06.jpg");
}
