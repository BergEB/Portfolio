class Bacteria {
  private float x;
  private float y;
  private float previousX;
  private float previousY;
  private float xVelocity;
  private float yVelocity;
  private int w;
  private int h;
  
  Bacteria() {
    x = (float)(Math.random() * 781) + 10;
    y = (float)(Math.random() * 781) + 10;
    xVelocity = (float)((Math.random() * 4) - 1);
    yVelocity = (float)((Math.random() * 4) - 1);
    if (xVelocity == 0 && yVelocity == 0) {
      if ((int)(Math.random() * 2) == 0) {
        xVelocity+= (int)((Math.random() * 2) + 1);
      }
      else {
        yVelocity+= (int)((Math.random() * 2) + 1);
      }
    }
    previousX = x - xVelocity;
    previousY = x - yVelocity;
    w = 30;
    h = 30;
  }
  
  void show() {
    fill(200);
    ellipseMode(CENTER);
    ellipse(x, y, w, h);
  }
  
  void move() {
    previousX = x;
    previousY = y;
    x+= xVelocity;
    y+= yVelocity;
  }
  
  void bounds() {
    if (x > width - (w / 2) || x < (w / 2)) {
      xVelocity*=-1;
    }
    if (y > height - (h / 2) || y < (h / 2)) {
      yVelocity*=-1;
    }
  }
  
  void collision() { // TODO: make the distance formula the first condition, then check which (x or y) is closer with 2 if statements within the first
    for (Bacteria i : b) {
      float triangleX = Math.abs(x - i.x);
      float triangleY = Math.abs(i.y - y);
      float triangleH = (float)Math.sqrt(sq(triangleX) + sq(triangleY));
      float collisionAngle = degrees(atan(triangleY / triangleX));
      if (Math.sqrt(sq(i.x - this.x) + sq(i.y - this.y)) <= w) {
        pushMatrix();
        translate(previousX, previousY);
        float thisDirection  = atan2(y, x);
        popMatrix();
        pushMatrix();
        translate(i.previousX, i.previousY);
        float iDirection = atan2(i.y, i.x);
        popMatrix();
        
      }
    }
    /*for (Bacteria i : b) {
      if (Math.abs(this.x - i.x) <= w && Math.sqrt(sq(i.x - this.x) + sq(i.y - this.y)) <= w) {
        this.xVelocity*=-1;
        i.xVelocity*=-1;
      } 
      if (Math.abs(this.y - i.y) <= h && Math.sqrt(sq(i.x - this.x) + sq(i.y - this.y)) <= h) {
        this.yVelocity*=-1;
        i.yVelocity*=-1;
      }
    }*/
  }
}
