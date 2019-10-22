class heightMapObject {
  int scl = 2;
  int cols;
  int rows;
  int peakX;
  int peakY;
  float peakZ;
  PrintWriter output;
  PImage heightmap;
  int index(int x, int y) {
  return x + y * heightmap.width;
  }
  
  heightMapObject() {
    cols = 800 / scl;
    rows = 800 / scl;
    terrain = new float[rows][cols];
    heightmap = loadImage("heightmap.jpg");
    heightmap.resize(800, 800);
    output = createWriter("heightValues.txt");
    peakZ = terrain[0][0];
  }
    
  void display() {
    //stroke(0, 255, 255);
    noStroke();
    //fill(0);
    translate(400, 400, 0);
    rotateZ(r);
    translate(-400, -400, 0);
    for (int y = 0; y < cols - 1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < rows; x++) {
        /*pushMatrix();
        rotateZ(x * ((2 * PI) / (800 / scl)));
        vertex(0, 400 + terrain[x][y], y);
        vertex(0, 400 + terrain[x][y + 1], y + 1);
        popMatrix();*/
        fill(terrain[x][y], 0, 255 - terrain[x][y]);
        /*stroke(terrain[x][y], 0, 255 - terrain[x][y]);
        translate(400, 400, 0);
        rotateZ(((2 * PI) / 800) * x);
        translate(terrain[x][y], 0, y);
        vertex(0, 0, 0);
        vertex(0, 1, 0);
        translate(-terrain[x][y], 0, -y);
        rotateZ(-(((2 * PI) / 800) * x));
        translate(-400, -400, 0);*/
        vertex(x * scl, y * scl, terrain[x][y]);        
        vertex(x * scl, (y + 1) * scl, terrain[x][y + 1]);
      }
      endShape();
      //translate(-400, -400, 0);
    }
    r+= (PI / 720);
  }
  
  void declare() {
    for (int y = 0; y < cols; y++) {
      for (int x = 0; x < rows; x++) {
        color pix = heightmap.pixels[index(x * scl, y * scl)];
        terrain[x][y] = red(pix);
      }
    }
  }
  
  void logHeightValues() {
    for (int y = 0; y < terrain.length; y++) {
      output.print("\n" + "\b" + y + "\n");
      for (int x = 0; x < terrain[y].length; x++) 
        output.print(terrain[x][y] + " ");
    }
  }
  
  void peak() {
    for (int y = 0; y < terrain.length / scl; y++) {
      for (int x = 0; x < terrain[y].length / scl; x++) {
        if (terrain[x][y] > peakZ) {
          peakZ = terrain[x][y];
          peakX = x * scl;
          peakY = y * scl;
        }
      }
    }
    stroke(230);
    line(peakX, peakY, (int)peakZ, peakX, peakY, (int)peakZ + 100);
  }
  
}
