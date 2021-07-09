// Portraits, day 9, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

PImage img;
float probFactor = 0.64;

void setup() {
  size(512, 512);
  img = loadImage("../ada.jpg");
  noStroke();
  noLoop();
}

void draw() {
  mondrianRecursion(width, 0, 0, 1.);
  
  save("result9.jpg");
}

void mondrianRecursion(int w, int x, int y, float prob) {
  if (random(1) < prob) { // we must divide again
    mondrianRecursion(w/2, x, y, prob*probFactor);
    mondrianRecursion(w/2, x + w/2, y, prob*probFactor);
    mondrianRecursion(w/2, x + w/2, y + w/2, prob*probFactor);
    mondrianRecursion(w/2, x, y + w/2, prob*probFactor);
  } else { // draw the image
    image(img, x, y, w, w);
  }
}
