LineSegment l0;
Ring r0;
horizontalLineSegment hl0;
fastHorizontalLineSegment fhl0;
fastLineSegment fl0;

void setup() {
  size(250, 250);
  frameRate(30);
  r0 = new Ring();
  l0 = new LineSegment();
  hl0 = new horizontalLineSegment();
  fhl0 = new fastHorizontalLineSegment();
  fl0 = new fastLineSegment();
  smooth(8);
}

void draw() {
  background(#252526);
  //r0.display();
  l0.display();
  hl0.display();
  fhl0.display();
  fl0.display();
}

class LineSegment {
  float x1;
  float y1;
  float x2;
  float y2;
  float x3;
  float y3;
  float x4;
  float y4;
  float x5;
  float y5;
  float x6;
  float y6;
  float x7;
  float y7;
  float x8;
  float y8;
  LineSegment() {
    x1 = width;
    y1 = height;
    x2 = width;
    y2 = height;
    x3 = 0;
    y3 = 0;
    x4 = 0;
    y4 = 0;
    x5 = width;
    y5 = 0;
    x6 = width;
    y6 = 0;
    x7 = 0;
    y7 = height;
    x8 = 0;
    y8 = height;
  }
  
  void display() {
    if (frameCount < 250) {
      expand();
      inverseExpand();
      rightInverseExpand();
      leftInverseExpand();
      limit();
      inverseLimit();
      rightInverseLimit();
      leftInverseLimit();
    }
    
    lDisplay();
    inverseDisplay();
    rightInverseDisplay();
    leftInverseDisplay();
  }
  
  void expand() {
    x1-= (width / 250.0);
    y2-= (height / 250.0);
  }
  
  void inverseExpand() {
    x3+= (width / 250.0);
    y4+= (height / 250.0);
  }
  
  void rightInverseExpand() {
    x5-= (width / 250.0);
    y6+= (height / 250.0);
  }
  
  void leftInverseExpand() {
    x7+= (width / 250.0);
    y8-= (height / 250.0);
  }
  
  void limit() {
    if (y2 == -height) {
      x1 = width;
      y2 = height;
    }
  }
  
  void inverseLimit() {
    if (y4 == height * 2) {
      x3 = 0;
      y4 = 0;
    }
  }
  
   void rightInverseLimit() {
    if (y6 == height * 2) {
      x5 = width;
      y6 = 0;
    }
  }
  
   void leftInverseLimit() {
    if (y8 == -height) {
      x7 = 0;
      y8 = height;
    }
  }
  
  void lDisplay() {
    stroke(#D5E5F2);
    fill(0);
    line(x1, y1, x2, y2);
  }
  
  void inverseDisplay() {
    stroke(#D5E5F2);
    fill(0);
    line(x3, y3, x4, y4);
  }
  
  void rightInverseDisplay() {
    stroke(#D5E5F2);
    fill(0);
    line(x5, y5, x6, y6);
  }
  
  void leftInverseDisplay() {
    stroke(#D5E5F2);
    fill(0);
    line(x7, y7, x8, y8);
  }
}

class Ring {
  float x1;
  float y1;
  float x0;
  float y0;
  Ring() {
    x1 = width;
    y1 = height;
    x0 = width / 2.0;
    y0 = height / 2.0;
  }
  
  void display() {
    if (frameCount < 250) {
      x1-= (width / 125.0);
      y1-= (height / 125.0);
      if (x1 == -width) {
        x1 = width;
        y1 = height;
      }
      stroke(#D5E5F2);
      fill(#252526);
      ellipse(x0, y0, x1, y1);
    }
  }
}

class fastHorizontalLineSegment {
  float x17;
  float y17;
  float x18;
  float y18;
  float x19;
  float y19;
  float x20;
  float y20;
  float x21;
  float y21;
  float x22;
  float y22;
  float x23;
  float y23;
  float x24;
  float y24;
  
  fastHorizontalLineSegment() {
    x17 = 0;
    y17 = 0;
    x18 = width;
    y18 = 0;
    x19 = 0;
    y19 = height;
    x20 = width;
    y20 = height;
    x21 = width;
    y21 = 0;
    x22 = width;
    y22 = height;
    x23 = 0;
    y23 = 0;
    x24 = 0;
    y24 = height;
  }
  
  void display() {
    stroke(#D5E5F2);
    fill(0);
    line(x17, y17, x18, y18);
    line(x19, y19, x20, y20);
    line(x21, y21, x22, y22);
    line(x23, y23, x24, y24);
    
    if (frameCount < 250) {
      y17+= (height / 125.0);
      y18+= (height / 125.0);
      y19-= (height / 125.0);
      y20-= (height / 125.0);
      x21-= (width / 125.0);
      x22-= (width / 125.0);
      x23+= (width / 125.0);
      x24+= (width / 125.0);
      if (y18 == height) {
        y17 = 0;
        y18 = 0;
      }
      if (y20 == 0) {
        y19 = height;
        y20 = height;
      }
      if (x22 == 0) {
        x21 = width;
        x22 = width;
      }
      if (x24 == width) {
        x23 = 0;
        x24 = 0;
      }
    }
  }
  
  
}

class fastLineSegment {
  float x25;
  float y25;
  float x26;
  float y26;
  float x27;
  float y27;
  float x28;
  float y28;
  float x29;
  float y29;
  float x30;
  float y30;
  float x31;
  float y31;
  float x32;
  float y32;
  fastLineSegment() {
    x25 = width;
    y25 = height;
    x26 = width;
    y26 = height;
    x27 = 0;
    y27 = 0;
    x28 = 0;
    y28 = 0;
    x29 = width;
    y29 = 0;
    x30 = width;
    y30 = 0;
    x31 = 0;
    y31 = height;
    x32 = 0;
    y32 = height;
  }
  
  void display() {
    if (frameCount < 250) {
      x25-= (width / 125.0);
      y26-= (height / 125.0);
      x27+= (width / 125.0);
      y28+= (height / 125.0);
      x29-= (width / 125.0);
      y30+= (height / 125.0);
      x31+= (width / 125.0);
      y32-= (height / 125.0);
      if (y26 == -height) {
        x25 = width;
        y26 = height;
      }
      if (y28 == height * 2) {
        x27 = 0;
        y28 = 0;
      }
      if (y30 == height * 2) {
        x29 = width;
        y30 = 0;
      }
      if (y32 == -height) {
        x31 = 0;
        y32 = height;
      }
    }
    stroke(#D5E5F2);
    fill(0);
    line(x25, y25, x26, y26);
    line(x27, y27, x28, y28);
    line(x29, y29, x30, y30);
    line(x31, y31, x32, y32);
  }
}

class horizontalLineSegment {
  float x9;
  float y9;
  float x10;
  float y10;
  float x11;
  float y11;
  float x12;
  float y12;
  float x13;
  float y13;
  float x14;
  float y14;
  float x15;
  float y15;
  float x16;
  float y16;
  horizontalLineSegment() {
    x9 = 0;
    y9 = 0;
    x10 = width;
    y10 = 0;
    x11 = 0;
    y11 = height;
    x12 = width;
    y12 = height;
    x13 = width;
    y13 = 0;
    x14 = width;
    y14 = height;
    x15 = 0;
    y15 = 0;
    x16 = 0;
    y16 = height;
  }
  
  void display() {
    if (frameCount < 250) {
      y9+= (height / 250.0);
      y10+= (height / 250.0);
      y11-= (height / 250.0);
      y12-= (height / 250.0);
      x13-= (width / 250.0);
      x14-= (width / 250.0);
      x15+= (width / 250.0);
      x16+= (width / 250.0);
      if (y10 == height) {
        y9 = 0;
        y10 = 0;
      }
      if (y12 == 0) {
        y11 = height;
        y12 = height;
      }
      if (x14 == 0) {
        x13 = width;
        x14 = width;
      }
      if (x16 == width) {
        x15 = 0;
        x16 = 0;
      }
    }
    stroke(#D5E5F2);
    fill(0);
    line(x9, y9, x10, y10);
    line(x11, y11, x12, y12);
    line(x13, y13, x14, y14);
    line(x15, y15, x16, y16);
  }
}
