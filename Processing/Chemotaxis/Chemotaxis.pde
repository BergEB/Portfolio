Bacteria [] b;
Bacteria m;
int cells;

void setup() {
  size(800, 800);
  cells = 1;
  b = new Bacteria[cells];
  for (int i = 0; i < b.length; i++) {
    b[i] = new Bacteria();
  }
}

void draw() {
  background(16);
  for (int i = 0; i < b.length; i++) {
    b[i].move();
    b[i].bounds();
    b[i].collision();
    b[i].show();
  }
}

void mousePressed() {
  divide();
}

void divide() {
  cells*= 2;
  b = new Bacteria[cells];
  for (int i = 0; i < b.length; i++) {
    b[i] = new Bacteria();
  }
  
}
