float R = 1200;
float s = 0;
float p = 0;

void setup() {
  size(1000, 1000, P3D);
  smooth(8);
}

void draw() {
  background(0);
  lights();
  pushMatrix();
  if (s > 180) {
    s = 0;
  }
  translate(width / 2, height / 2, -s + 775);
  s+=.01;
  rotateZ(p);
  beginShape(TRIANGLE_STRIP);
  for(float t = 0; t < 200; t+=1.55) {
    stroke(150, 0, 0);
    fill(map(t, 0, 200, 0, 255));
    vertex(R * cos(t), R * sin(t), t);
  }
  endShape();
  popMatrix();
  p+= PI / 2500;
}