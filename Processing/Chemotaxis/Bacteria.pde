int cells = 1;

class Bacteria {
  private int x;
  private int y;
  
  Bacteria(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void show() {
    fill(200);
    ellipse(x, y, 10, 10);
  }
  
  void move() {
    x+= (int)(Math.random() * 3) - 1;
    y+= (int)(Math.random() * 3) - 1;
  }
  
  void divide(int x) {
    cells*= 2;
  }
  
}
