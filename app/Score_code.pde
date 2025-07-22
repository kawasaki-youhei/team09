class ScoreManager {
  int score = 0;
  int coinCount = 0;
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
    coinCount++;
  }

  void draw() {
    fill(0);
    textSize(20);
    textAlign(LEFT, TOP);
    text("Score: " + score, 20, 20);
    text("Coins: " + coinCount + " / 10", 20, 50);
  }

  int getScore() {
    return score;
  }
  
   void reset() {
    score = 0;
    coinCount = 0;
    lastTime = millis();
  }
  
  int getCoinCount() {
    return coinCount;
  }
}
