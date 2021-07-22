// Portraits, day 22, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

// Circle packing

PImage img;
ArrayList<PVector> centers;
ArrayList<Float> diameters;

void setup() {
  size(512, 512);
  img = loadImage("../ada.jpg");
  noLoop();
  noStroke();
}

void draw() {
  background(0);
  
  int n = 8192; // max number of circles
  centers = new ArrayList<PVector>();
  diameters = new ArrayList<Float>();
  for (int i = 0; i < n; i++) {
    float d = random(4, 16);
    int x = (int)random(d, width-d);
    int y = (int)random(d, height-d);
    PVector new_circle = new PVector(x, y);
    
    if (canAddCircle(new_circle, d)) {
      centers.add(new_circle);
      diameters.add(d);
      color col = img.get(x, y);
      float bright = 16; // how brightened
      fill(red(col)+bright, green(col)+bright, blue(col)+bright);
      circle(x, y, d);
    }
  }
  
  save("result22.jpg");
}

boolean canAddCircle(PVector new_c, float new_d) {
  for (int i = 0; i < centers.size(); i++) {
    if (centers.get(i).dist(new_c) < (diameters.get(i) + new_d)/2.) {
      return false;
    }
  }
  return true;
}
