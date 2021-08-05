// Poetical Computer Vision, day 16, July 2021
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
  background(0);
  blendMode(ADD);
  
  float maxD = 5;
  float minD = 1;
  float alpha = 16.;
  float beta = 8.;
  for (int y = 0; y < height+9; y += 9) {
    for (int x = 0; x < width; x += 1) {
      float offset = sin(x/alpha)*beta;
      color col = img.get(x, int(y+offset));
      
      fill(255, 0, 0);
      float r = red(col);
      circle(x, y+offset, map(r, 0, 255, minD, maxD));
      
      fill(0, 255, 0);
      float g = green(col);
      circle(x, y+offset, map(g, 0, 255, minD, maxD));
      
      fill(0, 0, 255);
      float b = blue(col);
      circle(x, y+offset, map(b, 0, 255, minD, maxD));
    }
  }
  
  save("result16.jpg");
}
