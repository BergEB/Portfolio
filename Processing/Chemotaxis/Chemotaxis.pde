Bacteria [] b;
Bacteria m;
int cells;

void setup() {
  size(800, 800);
  cells = 1;
  b = new Bacteria[cells];
  for (int i = 0; i < b.length; i++) {
    b[i] = new Bacteria((float)(Math.random() * 750) + 25, (float)(Math.random() * 750) + 25, 1);
  }
}

void draw() {
  background(16);
  for (int i = 0; i < b.length; i++) {
    b[i].move();
    b[i].display();
    b[i].bounds();
  }
  stroke(0, 255, 0);
  fill(0, 255, 0);
  text("Particles: " + cells, 20, 770); 
  /*for (int i = 0; i < b.length; i++) {
    for (int j = i + 1; j < b.length; j++) {
      b[i].collision(b[j]);
    }
  }*/
}

void mousePressed() {
  divide();
}

void divide() {
  cells*= 2;
  b = new Bacteria[cells];
  for (int i = 0; i < b.length; i++) {
    b[i] = new Bacteria((float)(Math.random() * 750) + 25, (float)(Math.random() * 750) + 25, 1);
  }
  
}
