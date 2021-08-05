// Poetical Computer Vision, day 21, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

// Voronoi partition

PImage img;

void setup() {
  size(512, 512);
  img = loadImage("../../ada.jpg");
  noLoop();
  noStroke();
}

void draw() {
  int n = 2048; // number of seeds
  PVector[] seeds = new PVector[n];
  color[] colors = new color[n];
  for (int i = 0; i < n; i++) {
    int x = int(random(width));
    int y = int(random(height));
    seeds[i] = new PVector(x, y);
    colors[i] = img.get(x, y);
  }
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int argmin = 0;
      float minDist = dist(x, y, seeds[0].x, seeds[0].y);
      for (int i = 1; i < n; i++) {
        float dist = dist(x, y, seeds[i].x, seeds[i].y);
        if (dist < minDist) {
          minDist = dist;
          argmin = i;
        }
      }
      
      fill(colors[argmin]);
      square(x, y, 1);
    }
  }
  
  save("result21.jpg");
}
