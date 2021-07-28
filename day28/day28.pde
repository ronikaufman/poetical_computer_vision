// Portraits, day 28, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

// Horizontal pixel sorting with quicksort

PImage img;
int s = 128;

void setup() {
  size(512, 512);
  img = loadImage("../ada.jpg");
  noLoop();
  noStroke();
}

void draw() {
  for (int x = 0; x < width; x += s) {
    PImage partOfImg = img.get(x, 0, s, height);
    pixelSorting(partOfImg);
    image(partOfImg, x, 0);
  }
  
  save("result28.jpg");
}

void pixelSorting(PImage img) {
  img.loadPixels();
  for (int y = 0; y < img.height; y++) {
    int low = y*img.width;
    int high = (y+1)*img.width-1;
    quicksort(img, low, high);
  }
  img.updatePixels();
}

void quicksort(PImage img, int low, int high) {
  if (low >= high) return;
  int p = partition(img, low, high);
  quicksort(img, low, p-1);
  quicksort(img, p+1, high);
}

int partition(PImage img, int low, int high) {
  int pivot = colorVal(img.pixels[high]);
  int i = low;
  for (int j = low; j <= high; j++) {
    if (colorVal(img.pixels[j]) < pivot) {
      color tmp = img.pixels[i];
      img.pixels[i] = img.pixels[j];
      img.pixels[j] = tmp;
      i++;
    }
  }
  color tmp = img.pixels[i];
  img.pixels[i] = img.pixels[high];
  img.pixels[high] = tmp;
  return i;
}

int colorVal(color c) {
  float val = brightness(c);
  return (int)val;
}
