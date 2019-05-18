// create class of maze objects to be randomly generated

mazeType mT = new mazeType();

int playerDiameter, hallwayWidth, hallwayHeight, mazeRNG;

float playerHP, HPratio;

void setup() {
  size(512, 512);
  background(0);
}

void draw() {
  mT.easyMaze();
}
