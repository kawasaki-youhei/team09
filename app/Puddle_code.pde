class Puddle extends Obstacle {
  Puddle(float x, float y, PImage img) {
    super(x, y, img);
    width = 80;
    height = 80;
  }

  @Override
  void update() {
    super.update();
    constrainPosition();
  }
}
