heightMapJPG map;
HUD hud;
boolean created;

void setup() {
  size(800, 800);
  created = false;
  noCursor();
  map = new heightMapJPG();
  hud = new HUD();
  smooth(8);
  rectMode(CENTER);
}

void draw() {
  if (created == false) {
    background(0);
    fill(0);
    stroke(255);
    rect(400, 400, 300, 150, 7);
    stroke(100);
    fill(170);
    textSize(48);
    text("C R E A T E", 275, 415);
    hud.display();
    if (mousePressed && hud.within(250.0, 325.0, 550.0, 475.0)) {
      fill(0);
      rectMode(CENTER);
      rect(400, 400, 800, 800);
      map.create();
      save("Data/heightmap.jpg");
      created = true;
    }
  } else {
    fill(0);
    rectMode(CENTER);
    rect(400, 400, 800, 800);
    hud.display();
  }
}

class heightMapJPG {
  int scl = 1;
  int cols;
  int rows;
  float scale = 0.01;
  float[][] kolor;

  heightMapJPG() {
    cols = width / scl;
    rows = height / scl;
    kolor = new float[rows][cols];
  }
  
  void create() {
    float yoff = 0;
    for (int y = 0; y < cols; y++) {
      float xoff = 0;
      for (int x = 0; x < rows; x++) {
        kolor[x][y] = map(noise(xoff, yoff), 0, 1, 0, 255);
        xoff += scale;
      }
      yoff += scale;
    }
    for (int y = 0; y < cols; y++) {
      for (int x = 0; x < rows; x++) {
        noStroke();
        fill(kolor[x][y]);
        rect(x * scl, y * scl, scl, scl);
      }
    }
  }
}

  public class HUD {
    private float cursorStroke;
    
    HUD() {
    }
    
    void display() {
      cursor();
      
    }
    
    void cursor() {
      pushMatrix();
      translate(mouseX, mouseY);
      fill(200);
      interactable(250.0, 325.0, 550.0, 475.0);
      ellipse(0, 0, 8, 8);
      noStroke();
      popMatrix();
    }
    
    void interactable(double x1, double y1, double x2, double y2) {
      if (within(x1, y1, x2, y2)) {
        cursorStroke = 200;
        stroke(cursorStroke);
        noFill();
      }
    }
    
    boolean within(double x1, double y1, double x2, double y2) {
    if (mouseX >= x1 && mouseX <= x2 && mouseY >= y1 && mouseY <= y2) {
      return true;
    }
    else {
      return false;
    }
  }
}
