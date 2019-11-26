import peasy.*;

PeasyCam cam;
World w;

void setup() {
  size(800, 800, P3D);
  noLights();
  cam = new PeasyCam(this, height / 2, width / 2, 0, 800);
  w = new World();
}

void draw() {
  background(32, 3, 148);
  w.show();
}

interface Snow {
  void move();
  void show();
}

class Snowball implements Snow {
  private float xPos, yPos, zPos;
  
  Snowball() {
    xPos = (float)(Math.random() * 792) + 4;
    yPos = (float)(Math.random() * 792) + 4;
    zPos = 0;
  }
  
  void move() {
    
  }
  
  void show() {
    
  }
  
  void reset() { 
    
  }
  
  void hitbox() {
    
  }
}


class Snowman {
  
  void show() {
    
    
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
    translate(400, 400, 0);
    box(800, 800, 0);
    /*translate(0, 0, -200);
    rotateX(PI/2);
    ellipse(400, 400, 800, 800);
    cam.beginHUD();
    fill(255, 100);
    //noFill();
    //stroke(255, 50);
    ellipse(400, 400, 800, 800);
    cam.endHUD();*/
  }
  
}
