import peasy.*;
class hud {
 hud() {
  }
  
  void display() {
    textSize(32);
    fill(200, 0, 200);
    text((float)cam.getDistance(), 25, 825, 150);
    text((float)frameRate, 25, -25, 150);
  }
}
