// === Coinクラス ===
class Coin {
  float x, y;
  float speed = 4;
  boolean collected = false;

  Coin(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    if (!collected) y += speed;
  }

  void draw() {
    if (!collected) {
      fill(255, 215, 0);
      ellipse(x + 15, y + 15, 30, 30);
    }
  }

  boolean checkCollision(float px, float py, float pw, float ph) {
    if (!collected && px < x + 30 && px + pw > x && py < y + 30 && py + ph > y) {
      collected = true;
      return true;
    }
    return false;
  }

  boolean isOffScreen() {
    return y > height;
  }
}

// === Obstacleクラス ===
class Obstacle {
  float x, y;
  float speed = 5;

  Obstacle(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    y += speed;
  }

  void draw() {
    fill(200, 0, 0);
    rect(x, y, 40, 80);
  }

  boolean checkCollision(float px, float py, float pw, float ph) {
    return px < x + 40 && px + pw > x && py < y + 80 && py + ph > y;
  }

  boolean isOffScreen() {
    return y > height;
  }
}

// === スコア管理クラス ===
class ScoreManager {
  int score = 0;
  int coinPoint = 100;
  int timePoint = 1;
  int lastTime = 0;

  void update() {
    if (millis() - lastTime >= 1000) {
      score += timePoint;
      lastTime = millis();
    }
  }

  void addCoin() {
    score += coinPoint;
  }

  void draw() {
    fill(0);
    textSize(20);
    textAlign(LEFT, TOP);
    text("Score: " + score, 20, 20);
  }

  int getScore() {
    return score;
  }
}
