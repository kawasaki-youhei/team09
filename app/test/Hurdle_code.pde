class Hurdle extends Obstacle {
  Hurdle(float x, float y, PImage img) {
    super(x, y, img);
    width = 50;
    height = 25;
  }

  @Override
  void update() {
    super.update();
    constrainPosition();
  }
}
