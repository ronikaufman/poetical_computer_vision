// Portraits, day 4, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

PImage img;

void setup() {
  size(512, 512);
  img = loadImage("../ada.jpg");
  noStroke();
  noLoop();
}

void draw() {
  //image(img, 0, 0);
  
  for (int x = 0; x < width; x += 2) {
    for (int y = 0; y < height; y += 2) {
      color c = img.get(x, y);
      fill(0, green(c), blue(c));
      rect(x/2, y/2, 1, 1);
      fill(red(c), 0, blue(c));
      rect(width-x/2-1, y/2, 1, 1);
      fill(red(c), green(c), 0);
      rect(x/2, height-y/2-1, 1, 1);
      fill(red(c)*0.299 + green(c)*0.587 + blue(c)*0.114);
      rect(width-x/2-1, height-y/2-1, 1, 1);
    }
  }
  
  save("result4.jpg");
}
