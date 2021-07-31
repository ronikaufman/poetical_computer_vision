// Portraits, day 25, July 2021
// By Roni Kaufman
// https://ronikaufman.github.io/

// Image segmentation with k-means clustering

PImage img;
int k = 4;
int s = 32;
int MAX_ITER = 256;

void setup() {
  size(512, 512);
  img = loadImage("../../ada.jpg");
  noLoop();
  noStroke();
}

void draw() {
  for (int x = 0; x < width; x += s) {
    for (int y = 0; y < height; y += s) {
      PImage partOfImg = img.get(x, y, s, s);
      segmentation(partOfImg, x, y);
    }
  }
  
  save("result25.jpg");
}

void segmentation(PImage img, int x0, int y0) {
  PVector[][] data = imageToData(img);
  
  // initialization
  ArrayList<PVector> centroids = initialize(data);
  
  int[][] clusters;
  ArrayList<PVector> newCentroids;
  boolean stopMeNow;
  int iter = 0;
  do {
    
    // assignment
    clusters = assign(data, centroids);
    
    // update
    newCentroids = update(data, clusters);
    
    // check if we need to stop
    stopMeNow = (iter++ > MAX_ITER) || (centroids.containsAll(newCentroids)) || (newCentroids.containsAll(centroids));

  } while (!stopMeNow);
  
  clustersToImage(clusters, centroids, x0, y0);
}

PVector[][] imageToData(PImage img) {
  PVector[][] data = new PVector[img.width][img.height];
  
  for (int x = 0; x < s; x++) {
    for (int y = 0; y < s; y++) {
      color col = img.get(x, y);
      PVector v = new PVector(red(col), green(col), blue(col));
      data[x][y] = v;
    }
  }
  
  return data;
}

ArrayList<PVector> initialize(PVector[][] data) {
  ArrayList<PVector> centroids = new ArrayList<PVector>(k);
  for (int i = 0; i < k; i++) {
    int x = floor(random(s));
    int y = floor(random(s));
    PVector v = data[x][y];
    centroids.add(v);
  }
  return centroids;
}

int[][] assign(PVector[][] data, ArrayList<PVector> centroids) {
  int[][] clusters = new int[img.width][img.height];
  
  for (int x = 0; x < s; x++) {
    for (int y = 0; y < s; y++) {
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

ArrayList<PVector> update(PVector[][] data, int[][] clusters) {
  float[] sumsR = new float[k];
  float[] sumsG = new float[k];
  float[] sumsB = new float[k];
  int[] counts = new int[k];
  
  for (int x = 0; x < s; x++) {
    for (int y = 0; y < s; y++) {
      int c = clusters[x][y];
      PVector col = data[x][y];
      sumsR[c] += col.x;
      sumsG[c] += col.y;
      sumsB[c] += col.z;
      counts[c]++;
    }
  }
  
  ArrayList<PVector> newCentroids = new ArrayList<PVector>();
  for (int i = 0; i < k; i++) {
    int n = counts[i];
    PVector v = new PVector(sumsR[i]/n, sumsG[i]/n, sumsB[i]/n);
    newCentroids.add(v);
  }
  return newCentroids;
}

void clustersToImage(int[][] clusters, ArrayList<PVector> centroids, int x0, int y0) {
  for (int x = 0; x < s; x++) {
    for (int y = 0; y < s; y++) {
      int c = clusters[x][y];
      PVector col = centroids.get(c);
      fill(col.x, col.y, col.z);
      square(x+x0, y+y0, 1);
    }
  }
}
