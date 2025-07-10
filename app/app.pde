//main

BackGround BG1;
RoadStyle LS1; 

void setup() {
  size(800, 600);
  BG1 = new BackGround(224, 224, 224, 128, 192, 0);
  LS1 = new RoadStyle(255, 255, 255);

  BG1.display();
  LS1.drawCenter(10, 100);
}

void draw() {
  BG1.display();
  LS1.drawCenter(10, 100);
}
