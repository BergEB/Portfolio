

void setup() {
  size(800, 800);
  ArrayList<Sand> beach = new ArrayList<Sand>();
}

void display() {
  background(0);
}

void display() {
  for (int i  = 0; i < 50; i++) {
    beach.add(new Sand(5 * i, 5, 2, 2));
  } 
}

class Sand {
  private float x;
  private float y;
  private float x1;
  private float y1;

  Sand(float x, float y, float x1, float y1) {
    this.x = x;
    this.y = y;
    this.x1 = x1;
    this.y1 = y1;
  }
  
  void hitbox() {
    for (
