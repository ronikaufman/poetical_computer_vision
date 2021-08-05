// Poetical Computer Vision, day 8, July 2021
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
  
  int offRed = floor(random(2)) * 8;
  int offGreen = floor(random(2)) * 8;
  int offBlue = floor(random(2)) * 8;
  int maxNoise = 16;
  
  for (int y = 0; y < height; y += 1) {
    int processEffect = (y & 2) * 32;
    for (int x = 0; x < width; x += 1) {
      color c1 = grayify(img.get(x+offRed, y));
      color c2 = grayify(img.get(x+offGreen, y));
      color c3 = grayify(img.get(x+offBlue, y));
      fill(red(c1+processEffect) + floor(random(-maxNoise, maxNoise)), 
           green(c2+processEffect) + floor(random(-maxNoise, maxNoise)), 
           blue(c3+processEffect) + floor(random(-maxNoise, maxNoise)));
      rect(x, y, 1, 1);
    }
  }
  
  save("result08.jpg");
}

// Turns c into grayscale
color grayify(color c) {
  return color(red(c)*0.299 + green(c)*0.587 + blue(c)*0.114);
}
