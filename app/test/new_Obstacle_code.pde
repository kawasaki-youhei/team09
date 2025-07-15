class Obstacle {
  PImage img;
  float x, y;
  float speedY;
  float width, height;
  boolean passed = false;

  Obstacle(float x, float y, PImage img) {
    this.img = img;
    this.x = x;
    this.y = y;
    this.speedY = 4;
    this.width = 40;
    this.height = 40;
  }

  void update() {
    y += speedY;

    // プレイヤーを通り過ぎたら passed = true
    if (!passed && y > player.getY() + player.getH()) {
      passed = true;
    }
  }

  void display() {
    image(img, x, y, width, height);
  }

  boolean isOffScreen() {
    return y > height + 600;  // 高さが画面外に完全に出たか
  }

  boolean checkCollision(float px, float py, float pwidth, float pheight) {
    return !(px + pwidth < x || px > x + width || py + pheight < y || py > y + height);
  }

  void constrainPosition() {
    x = constrain(x, BB1.uppRoadL, BB1.uppRoadR - width);
  }
}
