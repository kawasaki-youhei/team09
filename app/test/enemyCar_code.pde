class EnemyCar extends Obstacle {
  float speedX = 2;

  EnemyCar(float x, float y, PImage img) {
    super(x, y, img);
    width = 100;
    height = 56;
  }

  @Override
  void update() {
    super.update();
    x += speedX;
    // 道路内で左右に往復
    if (x < BB1.uppRoadL) {
      x = BB1.uppRoadL;
      speedX *= -1;
    } else if (x > BB1.uppRoadR - width) {
      x = BB1.uppRoadR - width;
      speedX *= -1;
    }
  }
}
