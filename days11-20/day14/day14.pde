// Portraits, day 14, July 2021
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
  
  float step = 5e-3;
  float maxD = 4;
  float minD = 0.5;
  for (float i = 0; i < 375; i += step) {
    float x = width/2 + i * cos(i);
    float y = height/2 + i * sin(i);
    color c = img.get(int(x), int(y));
    
    fill(255, 0, 0);
    float r = red(c);
    circle(x, y, map(r, 0, 255, minD, maxD));
    
    fill(0, 255, 0);
    float g = green(c);
    circle(x, y, map(g, 0, 255, minD, maxD));
    
    fill(0, 0, 255);
    float b = blue(c);
    circle(x, y, map(b, 0, 255, minD, maxD));
  }
  
  save("result14.jpg");
}
