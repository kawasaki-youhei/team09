class Countdown {
  int startTime;
  int duration;
  boolean finished;

  Countdown(int durationMillis) {
    this.duration = durationMillis;
    this.finished = false;
    start();
  }

  void start() {
    startTime = millis();
    finished = false;
  }

  void update() {
    if (millis() - startTime >= duration) {
      finished = true;
    }
  }

  void display() {
    int elapsed = millis() - startTime;
    int remaining = duration - elapsed;

    background(0, 100, 200);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(80);

    if (remaining > 3000) {
      text("3", width / 2, height / 2);
    } else if (remaining > 2000) {
      text("2", width / 2, height / 2);
    } else if (remaining > 1000) {
      text("1", width / 2, height / 2);
    } else if (remaining > 0) {
      text("GO!", width / 2, height / 2);
    }
  }

  boolean isFinished() {
    return finished;
  }
}
