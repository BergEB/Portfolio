/* @pjs preload="../Processing/Terrain/heightMapRender/data/heightmap.jpg"; */

float x1;
float y1;
float r;
float rx;
float ry;
float rTx;
float rTy;
heightMapObject terrain0;
float[][] terrain;
int mouseXOrigin;
int mouseYOrigin;
int mouseXPrevious;
int mouseYPrevious;
float startMillis;

void setup() {
  frameRate(60);
  size(800, 800, P3D);
  smooth();
  terrain0 = new heightMapObject();
  terrain0.declare();
  hint(ENABLE_STROKE_PERSPECTIVE);
}

void draw() {
  background(16);
  lights();
  pushMatrix();
  translate(0, 0, -500);
  translate(400, 400, 0);
  mouseXPrevious = mouseXOrigin;
  mouseYPrevious = mouseYOrigin;
  mouseXOrigin = mouseX;
  mouseYOrigin = mouseY;
  if (mousePressed) {
    ry+= mouseXOrigin - mouseXPrevious;
    rx+= mouseYOrigin - mouseYPrevious;
    rotateY((PI / 1200) * (ry));
    rotateX(-(PI / 1200) * (rx));
    r = 0;
  }
  else {
    rTx+= rx;
    rTy+= ry;
    ry = 0;
    rx = 0;
    r+= PI / 2000;
  }
  rotateY((PI / 1200) * rTy);
  rotateX(-(PI / 1200) * rTx);
  rotateX(PI / 4);
  rotateZ(r);
  translate(-400, -400, 0);
  terrain0.display();
  popMatrix();
}

void keyPressed() {
  for (int y = 0; y < terrain.length; y++) {
    for (int x = 0; x < terrain[y].length; x++) {
      terrain[x][y] = 255 - terrain[x][y];
    }
  }
}

class heightMapObject {
  int scl = 20;
  int cols;
  int rows;
  int peakX;
  int peakY;
  float peakZ;
  PImage heightmap;
  int index(int x, int y) {
  return x + y * heightmap.width;
  }
  
  heightMapObject() {
    cols = 800 / scl;
    rows = 800 / scl;
    terrain = new float[rows][cols];
    heightmap = loadImage("../Processing/Terrain/heightMapRender/data/heightmap.jpg");
    heightmap.resize(800, 800);
    peakZ = terrain[0][0];
  }
    
  void display() {
    //stroke(0, 255, 255);
    noStroke();
    fill(0);
    
    for (int y = 0; y < cols - 1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < rows; x++) {
        //fill(terrain[x][y], 0, 255 - terrain[x][y]);
        stroke(terrain[x][y], 0, 255 - terrain[x][y]);
        vertex(x * scl, y * scl, terrain[x][y]);        
        vertex(x * scl, (y + 1) * scl, terrain[x][y + 1]);
      }
      endShape();
    }
  }
  
  void declare() {
    for (int y = 0; y < cols; y++) {
      for (int x = 0; x < rows; x++) {
        color pix = heightmap.pixels[index(x * scl, y * scl)];
        terrain[x][y] = red(pix);
      }
    }
  }
}
