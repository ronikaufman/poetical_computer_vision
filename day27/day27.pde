// Portraits, day 27, July 2021
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
  image(img, 0, 0);
  
  int N = 32768;
  for (int i = 0; i < N; i++) {
    int x = int(random(-16, width+16));
    int y = int(random(-16, height+16));
    float d = 4;
    color col = img.get(constrain(x, 0, width-1), constrain(y, 0, height-1));
    float r = random(-32, 32);
    fill(red(col)+r, green(col)+r, blue(col)+r, 128);
    drawParticle(x, y, d);
  }
  
  save("result27.jpg");
}

void drawParticle(int x, int y, float d) {
  PVector pos = new PVector(x, y);
  float freq = 1/512.;
  for (int i = 0; i < 16; i++) {
    float theta = noise(pos.x*freq, pos.y*freq)*PI*4;
    PVector v = PVector.fromAngle(theta);
    pos.add(v);
    circle(pos.x, pos.y, d);
  }
}
