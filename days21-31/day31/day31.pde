// Poetical Computer Vision, day 31, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

// Turing patterns

PImage img;

void setup() {
  size(512, 512);
  img = loadImage("../../ada.jpg");
  noLoop();
}

void draw() {
  for (int i = 0; i < 256; i++) {
    img = sharpen(img);
    img.filter(BLUR);
  }
  img = sharpen(img);
  image(img, 0, 0);
  
  save("result31.jpg");
}

PImage sharpen(PImage img) {
  PImage res = img.get(0, 0, img.width, img.height);
  
  for (int x = 1; x < width-1; x++) {
    for (int y = 1; y < height-1; y++) {
      float l = brightness(img.get(x-1, y)); // left
      float t = brightness(img.get(x, y-1)); // top
      float b = brightness(img.get(x, y+1)); // bottom
      float r = brightness(img.get(x+1, y)); // right
      
      color col = color(-1*(l+t+b+r) + 5*brightness(img.get(x, y)));
      res.set(x, y, col);
    }
  }
  
  return res;
}
