// Portraits, day 26, July 2021
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
  
  int N = 65536;
  for (int i = 0; i < N; i++) {
    int x = int(random(width));
    int y = int(random(height));
    float d = 6;
    color col = img.get(x, y);
    float r = random(-32, 32);
    fill(red(col)+r, green(col)+r, blue(col)+r);
    drawParticle(x, y, d);
  }
  
  save("result26.jpg");
}

void drawParticle(int x, int y, float d) {
  circle(x, y, d);
}
