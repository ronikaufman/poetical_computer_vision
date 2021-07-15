// Portraits, day 15, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

PImage img;

void setup() {
  size(512, 512);
  img = loadImage("../ada.jpg");
  noLoop();
  noStroke();
}

void draw() {
  background(0);
  blendMode(ADD);
  
  float phi = PI*(3-sqrt(5));
  float c = 4;
  float maxD = 5;
  float minD = 1.5;
  for (float i = 0; i < 8100; i++) {
    float rad = c*sqrt(i);
    float theta = i*phi;
    float x = width/2 + rad * cos(theta);
    float y = height/2 + rad * sin(theta);
    color col = img.get(int(x), int(y));
    
    fill(255, 0, 0);
    float r = red(col);
    circle(x, y, map(r, 0, 255, minD, maxD));
    
    fill(0, 255, 0);
    float g = green(col);
    circle(x, y, map(g, 0, 255, minD, maxD));
    
    fill(0, 0, 255);
    float b = blue(col);
    circle(x, y, map(b, 0, 255, minD, maxD));
  }
  
  save("result15.jpg");
}
