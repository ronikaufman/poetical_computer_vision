// Portraits, day 13, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

PImage img;

void setup() {
  size(512, 512);
  img = loadImage("../ada.jpg");
  noLoop();
}

void draw() {
  int n = 8;
  int s = width/n;
  
  int i = 0;
  PImage[] parts = new PImage[n*n];
  IntList order = new IntList();
  for (int x = 0; x < width; x += s) {
    for (int y = 0; y < height; y += s) {
      parts[i] = img.get(x, y, s, s);
      order.append(i++);
    }
  }
  
  order.shuffle();
  
  for (int x = 0; x < width; x += s) {
    for (int y = 0; y < height; y += s) {
      image(parts[order.pop()], x, y);
    }
  }
  
  save("result13.jpg");
}
