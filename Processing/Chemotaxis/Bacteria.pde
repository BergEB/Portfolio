class Bacteria {
  private float x;
  private float y;
  private float xA;
  private float yA;
  private int w;
  private int h;
  
  Bacteria() {
    x = (float)(Math.random() * 781) + 10;
    y = (float)(Math.random() * 781) + 10;
    xA = 3;
    if ((Math.random() * 2) == 0) {
      xA*=-1;
    }
    yA = 3;
    if ((Math.random() * 2) == 0) {
      yA*=-1;
    }
    w = 30;
    h = 30;
  }
  
  void show() {
    fill(200);
    ellipseMode(CENTER);
    ellipse(x, y, w, h);
  }
  
  void move() {
    x+= xA;
    y+= yA;
  }
  
  void bounds() {
    if (x > width - (w / 2) || x < (w / 2)) {
      xA*=-1;
    }
    if (y > height - (h / 2) || y < (h / 2)) {
      yA*=-1;
    }
  }
  
  void collision() { // TODO: make the distance formula the first condition, then check which (x or y) is closer with 2 if statements within the first
    for (Bacteria i : b) {
      if (Math.abs(this.x - i.x) <= w && Math.sqrt(sq(i.x - this.x) + sq(i.y - this.y)) <= w) {
        this.xA*=-1;
        i.xA*=-1;
      } 
      if (Math.abs(this.y - i.y) <= h && Math.sqrt(sq(i.x - this.x) + sq(i.y - this.y)) <= h) {
        this.yA*=-1;
        i.yA*=-1;
      }
    }
  }
}
