class Puddle extends Obstacle {
  Puddle(float x, float y, PImage img) {
    super(x, y, img);
    width = 60;
    height = 60;
  }

  @Override
  void update() {
    super.update();
    constrainPosition();
  }
}
