class heightMapJPG {
  int scl = 1;
  int cols;
  int rows;
  float scale = 0.01;
  float[][] kolor;

  heightMapJPG() {
    cols = width / scl;
    rows = height / scl;
    kolor = new float[rows][cols];
  }
  
  void create() {
    float yoff = 0;
    for (int y = 0; y < cols; y++) {
      float xoff = 0;
      for (int x = 0; x < rows; x++) {
        kolor[x][y] = map(noise(xoff, yoff), 0, 1, 0, 255);
        xoff += scale;
      }
      yoff += scale;
    }
    for (int y = 0; y < cols; y++) {
      for (int x = 0; x < rows; x++) {
        noStroke();
        fill(kolor[x][y]);
        rect(x * scl, y * scl, scl, scl);
      }
    }
  }
}
