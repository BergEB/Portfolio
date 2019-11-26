import peasy.*;

PeasyCam cam;
World w;
Snowman guy = new Snowman();
ArrayList<Snowball> snowballs = new ArrayList<Snowball>();

void setup() {
  size(800, 800, P3D);
  lights();
  cam = new PeasyCam(this, height / 2, (width / 2) - 200, 0, 1000);
  cam.setMaximumDistance(1500);
  cam.setMinimumDistance(100);
  w = new World();
  for (int i = 0; i < 500; i++) {
    snowballs.add( new Snowball());
  }
}

void draw() {
  background(32, 3, 148);
  w.show();
  guy.body();
  for (int i = 0; i < snowballs.size(); i++) {
    snowballs.get(i).show();
    snowballs.get(i).move();
    snowballs.get(i).reset();
  }
}

interface Snow {
  void move();
  void show();
}

class Snowball implements Snow {
  private float xPos, yPos, zPos, zVel, xSpiral, ySpiral, r;
  
  Snowball() {
    zPos = (float)(Math.random() * 1000) + 4;
    r = (float)(Math.random() * 5);
    xPos = ((float)(Math.random() * (792 - (r * 2))) + 4) - 400;
    yPos = ((float)(Math.random() * (792 - (r * 2))) + 4) - 400;
    zVel = /*(int)(Math.random() * 2) + */1;
    noLights();
  }
  
  void move() {
    zPos-= zVel;
    xSpiral = r * cos(6 * zPos);
    ySpiral = r * sin(6 * zPos);
  }
  
  void show() {
    sphereDetail(10);
    pushMatrix();
    translate(xPos + xSpiral, yPos + ySpiral, zPos);
    fill(255);
    noStroke();
    sphere(2);
    popMatrix();
  }
  
  void reset() { 
    if (zPos < 0) {
      zPos = 1000;
    }
  }
  
  void hitbox() {
    
  }
}


class Snowman {
  
  void show() {
    
  }
  
  void body() {
    pushMatrix();
    sphereDetail(32);
    fill(255);
    translate(-200, -150, 16);
    sphere(32);
    translate(0, 0, 36);
    sphere(24);
    translate(0, 0, 28);
    sphere(18);
    popMatrix();
  }
  
}


class Tree {
  
  void show() {
    
  }
  
}


class House {
  
  void show() {
    
  }
  
}


class Sleigh {
  
  void show() {
    
  }
  
  void move() {
    
  }
  
}


class World {
  
  void show() {
    translate(400, 400, 4);
    fill(0);
    rotateX(PI/2.2);
    box(800, 800, 8);
    
    /*
    translate(0, 0, -200);
    rotateX(PI/2);
    cam.beginHUD();
    fill(255, 100);
    //noFill();
    //stroke(255, 50);
    cam.endHUD();
    */
  }
  
}
