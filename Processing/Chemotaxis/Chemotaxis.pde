Bacteria [] b;
Bacteria m;
int cells;

void setup() {
  size(800, 800);
  cells = 1;
  b = new Bacteria[cells];
  for (int i = 0; i < b.length; i++) {
    b[i] = new Bacteria((float)(Math.random() * 750) + 25, (float)(Math.random() * 750) + 25, 10);
    /*for (int j = i + 1; j < b.length; j++) {
      if (Math.abs(b[i].position.x - b[j].position.x) < b[i].radius) {
        b[i].position.x = (float)(Math.random() * 750) + 25;
      }
      if (Math.abs(b[i].position.y - b[j].position.y) < b[i].radius) {
        b[i].position.y = (float)(Math.random() * 750) + 25;
      }
    }*/
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
  for (int i = 0; i < b.length; i++) {
    for (int j = i + 1; j < b.length; j++) {
      b[i].collision(b[j]);
    }
  }
}

void mousePressed() {
  divide();
}

void divide() {
  cells*= 2;
  b = new Bacteria[cells];
  for (int i = 0; i < b.length; i++) {
    b[i] = new Bacteria((float)(Math.random() * 750) + 25, (float)(Math.random() * 750) + 25, 10);
    /*for (int j = i + 1; j < b.length; j++) {
      if (Math.abs(b[i].position.x - b[j].position.x) < b[i].radius) {
        b[i].position.x = (float)(Math.random() * 750) + 25;
      }
      if (Math.abs(b[i].position.y - b[j].position.y) < b[i].radius) {
        b[i].position.y = (float)(Math.random() * 750) + 25;
      }
    }*/
  }
  
}

class Bacteria {
  PVector position;
  PVector velocity;
  PVector mouseVector;
  float radius, m;
  
  Bacteria(float x, float y, float r) {
    position = new PVector(x, y);
    velocity = PVector.random2D();
    mouseVector = new PVector((mouseX - x) / 100, (mouseY - y) / 100);
    velocity.mult(3);
    radius = r;
    m = radius*.1;
  }
  
  void display() {
    noStroke();
    fill(200);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
  void move() {
    mouseVector = new PVector(((width / 2) - position.x) / 100, ((height / 2) - position.y) / 100);
    if (mousePressed) {
      position.add(mouseVector);
    } else {
    position.add(velocity);
    }
  }
  
  void bounds() {
    if (position.x > width-radius) {
      position.x = width-radius;
      velocity.x *= -1;
    } else if (position.x < radius) {
      position.x = radius;
      velocity.x *= -1;
    } else if (position.y > height-radius) {
      position.y = height-radius;
      velocity.y *= -1;
    } else if (position.y < radius) {
      position.y = radius;
      velocity.y *= -1;
    }
  }
  
  void collision(Bacteria other) {
    PVector distanceVect = PVector.sub(other.position, position);
    float distanceVectMag = distanceVect.mag();
    float minDistance = radius + other.radius;
    
    if (distanceVectMag < minDistance) {
      float distanceCorrection = (minDistance-distanceVectMag)/2.0;
      PVector d = distanceVect.copy();
      PVector correctionVector = d.normalize().mult(distanceCorrection);
      other.position.add(correctionVector);
      position.sub(correctionVector);
      
      // get angle of distanceVect
      float theta  = distanceVect.heading();
      
      // precalculate trig values
      float sine = sin(theta);
      float cosine = cos(theta);
      PVector[] bTemp = {
        new PVector(), new PVector()
      };
      bTemp[1].x  = cosine * distanceVect.x + sine * distanceVect.y;
      bTemp[1].y  = cosine * distanceVect.y - sine * distanceVect.x;
      PVector[] vTemp = {
        new PVector(), new PVector()
      };
      vTemp[0].x  = cosine * velocity.x + sine * velocity.y;
      vTemp[0].y  = cosine * velocity.y - sine * velocity.x;
      vTemp[1].x  = cosine * other.velocity.x + sine * other.velocity.y;
      vTemp[1].y  = cosine * other.velocity.y - sine * other.velocity.x;
      PVector[] vFinal = {  
        new PVector(), new PVector()
      };
      // final rotated velocity for b[0]
      vFinal[0].x = ((m - other.m) * vTemp[0].x + 2 * other.m * vTemp[1].x) / (m + other.m);
      vFinal[0].y = vTemp[0].y;
      
      // final rotated velocity for b[0]
      vFinal[1].x = ((other.m - m) * vTemp[1].x + 2 * m * vTemp[0].x) / (m + other.m);
      vFinal[1].y = vTemp[1].y;
      
      //clumping
      bTemp[0].x += vFinal[0].x;
      bTemp[1].x += vFinal[1].x;
      
      // rotate balls
      PVector[] bFinal = { 
        new PVector(), new PVector()
      };
      bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
      bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
      bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
      bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;
      
      // update balls to screen position
      other.position.x = position.x + bFinal[1].x;
      other.position.y = position.y + bFinal[1].y;
      position.add(bFinal[0]);
      
      // update velocities
      velocity.x = cosine * vFinal[0].x - sine * vFinal[0].y;
      velocity.y = cosine * vFinal[0].y + sine * vFinal[0].x;
      other.velocity.x = cosine * vFinal[1].x - sine * vFinal[1].y;
      other.velocity.y = cosine * vFinal[1].y + sine * vFinal[1].x;
    }
    /*for (Bacteria i : b) {
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
    }*/
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
