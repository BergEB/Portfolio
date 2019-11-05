Bacteria [] b;
Bacteria m;
int cells = 1;

void setup() {
  size(800, 800);
  b = new Bacteria[cells];
  for (int i = 0; i < b.length; i++) {
    b[i] = new Bacteria(width / 2, height / 2);
  }
}

void draw() {
  background(16);
  mousePressed();
  for (int i = 0; i < b.length; i++) {
    b[i].show();
    b[i].move();
  }
}

void mousePressed() {
  divide();
}

void divide() {
  cells*= 2;
}
