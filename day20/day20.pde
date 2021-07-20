// Portraits, day 20, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

// Sobel operator

PImage img;

void setup() {
  size(512, 512);
  img = loadImage("../ada.jpg");
  noLoop();
  noStroke();
  colorMode(HSB, PI, 255, 255);
}

void draw() {
  background(0);
  img.filter(BLUR, 1);
  
  for (int x = 1; x < width-1; x++) {
    for (int y = 1; y < height-1; y++) {
      float tl = brightness(img.get(x-1, y-1)); // top left
      float l = brightness(img.get(x-1, y)); // left
      float bl = brightness(img.get(x-1, y+1)); // bottom left
      float t = brightness(img.get(x, y-1)); // top
      float b = brightness(img.get(x, y+1)); // bottom
      float tr = brightness(img.get(x+1, y-1)); // top right
      float r = brightness(img.get(x+1, y)); // right
      float br = brightness(img.get(x+1, y+1)); // bottom right
      
      float Gx = tl + 2*l + bl - tr - 2*r - br;
      float Gy = tl + 2*t + tr - bl - 2*b - br;
      float G = sqrt(sq(Gx)+sq(Gy));
      float theta = atan(Gy/Gx);
      
      fill(theta+PI/2, 255, G);
      square(x, y, 1);
    }
  }
  
  /*
  colorMode(RGB);
  for (int x = 1; x < width-1; x++) {
    for (int y = 1; y < height-1; y++) {
      color tl = (img.get(x-1, y-1)); // top left
      color l = (img.get(x-1, y)); // left
      color bl = (img.get(x-1, y+1)); // bottom left
      color t = (img.get(x, y-1)); // top
      color b = (img.get(x, y+1)); // bottom
      color tr = (img.get(x+1, y-1)); // top right
      color r = (img.get(x+1, y)); // right
      color br = (img.get(x+1, y+1)); // bottom right
      
      float rGx = red(tl) + 2*red(l) + red(bl) - red(tr) - 2*red(r) - red(br);
      float rGy = red(tl) + 2*red(t) + red(tr) - red(bl) - 2*red(b) - red(br);
      float rG = sqrt(sq(rGx)+sq(rGy));
      float rTheta = 255*(atan(rGy/rGx)+PI/2)/PI;
      
      float gGx = green(tl) + 2*green(l) + green(bl) - green(tr) - 2*green(r) - green(br);
      float gGy = green(tl) + 2*green(t) + green(tr) - green(bl) - 2*green(b) - green(br);
      float gG = sqrt(sq(gGx)+sq(gGy));
      float gTheta = 255*(atan(gGy/gGx)+PI/2)/PI;
      
      float bGx = blue(tl) + 2*blue(l) + blue(bl) - blue(tr) - 2*blue(r) - blue(br);
      float bGy = blue(tl) + 2*blue(t) + blue(tr) - blue(bl) - 2*blue(b) - red(br);
      float bG = sqrt(sq(bGx)+sq(bGy));
      float bTheta = 255*(atan(bGy/bGx)+PI/2)/PI;
      
      fill(rTheta, gTheta, bTheta);
      square(x, y, 1);
    }
  }
  */
  
  save("result20.jpg");
}
