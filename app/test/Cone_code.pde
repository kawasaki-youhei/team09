class Cone extends Obstacle {
  Cone(float x, float y, PImage img) {
    super(x, y, img);
    width = 50;
    height = 50;
  }

  @Override
  void update() {
    super.update();
    constrainPosition();
  }
}
