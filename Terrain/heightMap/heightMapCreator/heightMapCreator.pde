
heightMapJPG map;

void setup() {
  size(800, 800);
  map = new heightMapJPG();
  map.create();
  save("heightmap.jpg");
}
