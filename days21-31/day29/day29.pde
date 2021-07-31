// Portraits, day 29, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

// ASCII art

PImage img;
String ramp = " .:-=+*#%@";
// source: http://paulbourke.net/dataformats/asciiart/

void setup() {
  size(512, 512);
  img = loadImage("../../ada.jpg");
  noLoop();
  noStroke();
  fill(255);
  PFont mono = createFont("Consolas", 20);
  textFont(mono);
  textAlign(LEFT, TOP);
}

void draw() {
  background(0);
  int s = 16;
  
  for (int x = 0; x < width; x += s) {
    for (int y = 0; y < height; y += s) {
      float gray = grayify(img.get(x, y));
      int idx = (int)map(gray, 0, 255, 0, ramp.length());
      char ch = ramp.charAt(idx);
      text(ch, x+3, y-3);
    }
  }
  
  save("result29.jpg");
}

// Turns c into grayscale
float grayify(color c) {
  return red(c)*0.299 + green(c)*0.587 + blue(c)*0.114;
}
