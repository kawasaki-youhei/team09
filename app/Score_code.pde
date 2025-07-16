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
