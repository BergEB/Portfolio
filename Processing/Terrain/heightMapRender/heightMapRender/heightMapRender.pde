import peasy.*;

heightMapObject terrain0;
PeasyCam cam;
float[][] terrain;
hud h;
float r;

void setup() {
  frameRate(60);
  size(1000, 600, P3D);
  smooth(8);
  terrain0 = new heightMapObject();
  cam = new PeasyCam(this, 400, 400, 127, 800);
  cam.setMaximumDistance(1370);
  cam.setMinimumDistance(100);
  h = new hud();
  terrain0.declare();
  terrain0.logHeightValues();
  //cam.beginHUD();
}

void draw() {
  background(0);
  lights();
  println(frameRate);
  terrain0.display();
  h.display();
  terrain0.peak();
}

void keyPressed() {
  for (int y = 0; y < terrain.length; y++) {
    for (int x = 0; x < terrain[y].length; x++) {
      terrain[x][y] = 255 - terrain[x][y];
    }
  }
  terrain0.peak();
}
