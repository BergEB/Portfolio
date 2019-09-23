heightMapJPG mapp;
hmm defo;
float x1;
float xRate;
float y1;
float yRate;
float fat;
float tall;
PFont robotoThin;

void setup() {
  size(1000, 600);
    frameRate(30);
  noCursor();
  mapp = new heightMapJPG();
  defo = new hmm();
  x1 = width / 2;
  y1 = height / 2;
  fat = 1.0;
  tall = 1.0 / 3.0;
  xRate = 1;
  yRate = 1;
}

void draw() {
  background(0);
  mapp.create();
  imageMode(CENTER);
  //clip((float)(Math.random() * (double)width), (float)(Math.random() * (double)height), (float)(Math.random() * (double)width) + (float)(Math.random() * 100.0), (float)(Math.random() * (double)height) + (float)(Math.random() * 100.0));
  //clip(mouseX, mouseY, (float)(Math.random() * 100) + 150, (float)(Math.random() * 100) + 150);
  defo.display();
  if (keyPressed && keyCode == SHIFT) {
    fill(10);
    rect(x1, y1, fat, tall);
    x1-= xRate;
    y1-= (6.0 / 10.0) * yRate;
    fat+= xRate * 2.0;
    tall+= (6.0 / 10.0) * 2.0 * yRate;
    yRate = yRate * 1.02;
    xRate = xRate * 1.02;
  }
}

class heightMapJPG {
  float scl = 1;
  float cols;
  float rows;
  float scale = 0.01;
  float[][] kolor;

  heightMapJPG() {
    cols = 100;
    rows = 100;
    kolor = new float[(int)rows][(int)cols];
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
        fill(kolor[x][y], 50);
        rect(((float)x * scl) * (width / cols), ((float)y * scl) * (height / rows), (scl + (width / cols)), (scl + (height / rows)));
      }
    }
    scale = (float)(Math.random());
  }
}

class hmm {
  PFont robotoThin;
  float slideX;
  
  hmm() {
    robotoThin = createFont("Roboto-Thin.ttf", 32);
  }
  
  void display() {
    textFont(robotoThin, 32);
    fill(255, 100);
    pushMatrix();
    translate(450, 280);
    //rotate((PI / 4.5));
    for (float x = 0; x < 20; x++) {
      for (float y = 0; y < 18; y++) {
        pushMatrix();
        if (x % 2 == 0) {
          translate(0, slideX);
        }
        else {
          translate(0, -slideX);
        }
        if ((x % 2 == 0 && y % 2 == 0) || (x % 2 != 0 && y % 2 != 0)) {
          fill(255, 100);
          text("defo", x * 100 - 800, y * 60 - 480);
        }
        else {
          fill(255, 160);
          text("defo", x * 100 - 800, y * 60 - 480);
        }
        popMatrix();
      }
    }
    popMatrix();
    if (((double)slideX * Math.random()) % 30 < 2) {
      fill(255, 255);
    }
    else {
      fill(200, 0);
    }
    if (slideX > 118) {
      slideX = 0;
    }
    else {
      slideX++;
    }
    textFont(robotoThin, 128);
    text("<RB>", 354, 225.5, 294, 151);
  }
}
