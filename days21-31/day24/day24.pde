// Poetical Computer Vision, day 24, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

// Image segmentation with k-means clustering

PImage img;

void setup() {
  size(512, 512);
  img = loadImage("../../ada.jpg");
  noLoop();
  noStroke();
}

void draw() {
  img.filter(BLUR, 1);
  img.resize(img.width/2, img.height/2);
  
  PVector[][] data = imageToData();
  int k = 3;
  
  // initialization
  ArrayList<PVector> centroids = initialize(data, k);
  
  int[][] clusters;
  ArrayList<PVector> newCentroids;
  boolean stopMeNow;
  int iter = 0;
  int MAX_ITER = 512;
  do {
    
    // assignment
    clusters = assign(data, centroids);
    
    // update
    newCentroids = update(data, clusters, k);
    
    // check if we need to stop
    stopMeNow = (iter++ > MAX_ITER) || (centroids.containsAll(newCentroids)) || (newCentroids.containsAll(centroids));

  } while (!stopMeNow);
  
  color[][] palette = {{#0a1966, #ffef0d, #fafafa},
                       {#ee726b, #ffc5c7, #fef9c6},
                       {#0b1435, #218ad4, #76df55},
                       {#102340, #fe01ec, #8a07da}};
  for (int i = 0; i < 4; i++) {
    int x0 = (i%2)*width/2;
    int y0 = floor(i/2)*height/2;
    color[] colors = palette[i];
    clustersToImage(clusters, x0, y0, colors);
  }
  
  save("result24.jpg");
}

PVector[][] imageToData() {
  PVector[][] data = new PVector[img.width][img.height];
  
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      color col = img.get(x, y);
      PVector v = new PVector(red(col), green(col), blue(col));
      data[x][y] = v;
    }
  }
  
  return data;
}

ArrayList<PVector> initialize(PVector[][] data, int k) {
  ArrayList<PVector> centroids = new ArrayList<PVector>(k);
  for (int i = 0; i < k; i++) {
    int x = floor(random(img.width));
    int y = floor(random(img.height));
    PVector v = data[x][y];
    centroids.add(v);
  }
  return centroids;
}

int[][] assign(PVector[][] data, ArrayList<PVector> centroids) {
  int[][] clusters = new int[img.width][img.height];
  
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      PVector col = data[x][y];
      
      // find closest centroids
      int argmin = 0;
      float minDist = col.dist(centroids.get(0));
      for (int i = 1; i < centroids.size(); i++) {
        float d = col.dist(centroids.get(i));
        if (d < minDist) {
          argmin = i;
          minDist = d;
        }
      }
      
      // assign
      clusters[x][y] = argmin;
    }
  }
  
  return clusters;
}

ArrayList<PVector> update(PVector[][] data, int[][] clusters, int k) {
  float[] sumsR = new float[k];
  float[] sumsG = new float[k];
  float[] sumsB = new float[k];
  int[] counts = new int[k];
  
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      int c = clusters[x][y];
      PVector col = data[x][y];
      sumsR[c] += col.x;
      sumsG[c] += col.y;
      sumsB[c] += col.z;
      counts[c]++;
    }
  }
  
  ArrayList<PVector> newCentroids = new ArrayList<PVector>(k);
  for (int i = 0; i < k; i++) {
    int n = counts[i];
    PVector v = new PVector(sumsR[i]/n, sumsG[i]/n, sumsB[i]/n);
    newCentroids.add(v);
  }
  return newCentroids;
}

void clustersToImage(int[][] clusters, int x0, int y0, color[] colors) {
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      int c = clusters[x][y];
      color col = colors[c];
      fill(col);
      square(x+x0, y+y0, 1);
    }
  }
}
