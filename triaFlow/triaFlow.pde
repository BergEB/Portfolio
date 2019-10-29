float R;
float rAcc;

void setup() {
  size(800, 800);
  R = 0;
  rAcc = PI / 2500;
}

void draw() {
  background(0);
  for (int i = 20; i > 0; i--) {
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(R * (11.5 - i));
    polygonFX((i * 30) - 20);
    popMatrix();
  }
  R+= rAcc;
}


void polygonFX(int n) {
    fill(0);
    stroke(200);
    strokeWeight(2);
    polygon(0, 0, n, 3);
  }

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
