float x1;
float y1;
float xS;
float yS;
float zS;
float xSA;
float ySA;
float zSA;
float r;

void setup() {
  size(800, 800, P3D); 
  smooth(8);
  r = 0;
  xS = 0;
  yS = 0;
  zS = 0;
  xSA = (float)(Math.random() * 3) + 2;
  ySA = (float)(Math.random() * 3) + 2;
  zSA = (float)(Math.random() * 3) + 2;
}

void draw() {
  background(16);
  r+= PI / 1200;
  pushMatrix();
  noFill();
  stroke(200);
  strokeWeight(1.5);
  translate(400, 400, -25);
  if (mousePressed) {
    rotateY((PI / 1200) * (mouseX - x1));
    rotateX((PI / 1200) * (y1 - mouseY));
    r = 0;
  }
  else {
    x1 = mouseX;
    y1 = mouseY;
    rotateY(r);
    rotateX(r);
  }
  box(400);
  fill(200);
  noStroke();
  
  pushMatrix();
  xS+= xSA;
  yS+= ySA;
  zS+= zSA;
  if (xS > 190 || xS < -190) {
    xSA*= -1;
  }
  if (yS > 190 || yS < -190) {
    ySA*= -1;
  }
  if (zS > 190 || zS < -190) {
    zSA*= -1;
  }
  translate(xS, yS, zS);
  sphere(10);
  popMatrix();
  
  popMatrix();
  
}
