// Portraits, day 1, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

PImage img;

void setup() {
  size(512, 512);
  img = loadImage("../ada.jpg");
  noStroke();
}

void draw() {
  //image(img, 0, 0);
  int s = 8;
  
  for (int x = 0; x < width; x += s) {
    for (int y = 0; y < height; y += s) {
      color c = img.get(x+s/2, y+s/2);
      fill(c);
      rect(x, y, s, s);
    }
  }
  
  save("result1.jpg");
}
