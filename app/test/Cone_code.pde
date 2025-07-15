class Cone extends Obstacle {
  Cone(float x, float y, PImage img) {
    super(x, y, img);
    width = 40;
    height = 80;
  }

  @Override
  void update() {
    super.update();
    constrainPosition();
  }
}
