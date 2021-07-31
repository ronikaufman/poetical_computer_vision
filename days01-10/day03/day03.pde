// Portraits, day 3, July 2021
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
  int s = 1;
  
  for (int x = 0; x < width; x += s) {
    for (int y = 0; y < height; y += s) {
      color c = img.get(x, y);
      float r, g, b;
      if (floor(noise(x/256., y/256., 1)*10) % 2 == 0) {
        r = red(c);
      } else {
        r = 255-red(c);
      }
      if (floor(noise(x/256., y/256., 2)*10) % 2 == 0) {
        g = green(c);
      } else {
        g = 255-green(c);
      }
      if (floor(noise(x/256., y/256., 3)*10) % 2 == 0) {
        b = blue(c);
      } else {
        b = 255-blue(c);
      }
      fill(r, g, b);
      rect(x, y, s, s);
    }
  }
  
  save("result03.jpg");
}
