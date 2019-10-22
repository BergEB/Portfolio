import peasy.*;
class hud {
 hud() {
  }
  
  void display() {
    cam.beginHUD();
    textSize(24);
    fill(0, 255, 255, 100);
    text((float)cam.getDistance(), 0, 25, 0);
    text((float)frameRate, 0, 50, 0);
    cam.endHUD();
  }
}
