Tile[] tiles = {new Tile(true, 0, 0), new Tile(false, 64, 0), new Tile(false, 64*2, 0), new Tile(true, 64*3, 0), new Tile(true, 64*4, 0), new Tile(true, 64*5, 0), new Tile(true, 64*6, 0), new Tile(true, 64*7, 0), // row0
  new Tile(true, 0, 64), new Tile(false, 64, 64), new Tile(false, 64*2, 64), new Tile(false, 64*3, 64), new Tile(true, 64*4, 64), new Tile(false, 64*5, 64), new Tile(false, 64*6, 64), new Tile(true, 64*7, 64), // row1
  new Tile(true, 0, 64*2), new Tile(true, 64, 64*2), new Tile(true, 64*2, 64*2), new Tile(true, 64*3, 64*2), new Tile(true, 64*4, 64*2), new Tile(false, 64*5, 64*2), new Tile(false, 64*6, 64*2), new Tile(true, 64*7, 64*2), // row2 
  new Tile(false, 0, 64*3), new Tile(false, 64, 64*3), new Tile(false, 64*2, 64*3), new Tile(true, 64*3, 64*3), new Tile(false, 64*4, 64*3), new Tile(false, 64*5, 64*3), new Tile(true, 64*6, 64*3), new Tile(true, 64*7, 64*3), // row3
  new Tile(false, 0, 64*4), new Tile(true, 64, 64*4), new Tile(true, 64*2, 64*4), new Tile(true, 64*3, 64*4), new Tile(true, 64*4, 64*4), new Tile(false, 64*5, 64*4), new Tile(true, 64*6, 64*4), new Tile(false, 64*7, 64*4), // row4
  new Tile(false, 0, 64*5), new Tile(true, 64, 64*5), new Tile(false, 64*2, 64*5), new Tile(false, 64*3, 64*5), new Tile(true, 64*4, 64*5), new Tile(false, 64*5, 64*5), new Tile(true, 64*6, 64*5), new Tile(true, 64*7, 64*5), // row5
  new Tile(false, 0, 64*6), new Tile(true, 64, 64*6), new Tile(true, 64*2, 64*6), new Tile(false, 64*3, 64*6), new Tile(true, 64*4, 64*6), new Tile(false, 64*5, 64*6), new Tile(false, 64*6, 64*6), new Tile(true, 64*7, 64*6), // row6
  new Tile(false, 0, 64*7), new Tile(false, 64, 64*7), new Tile(false, 64*2, 64*7), new Tile(false, 64*3, 64*7), new Tile(true, 64*4, 64*7), new Tile(true, 64*5, 64*7), new Tile(false, 64*6, 64*7), new Tile(true, 64*7, 64*7), // row7
};

Maze maze = new Maze(tiles, 0);

//variables and data
int[] circlesX = new int[8];
int[] circlesY = new int[8];

boolean circlesActive = false;
int maxTimer = 180;
int circleTimer = 0;
//three seconds time 60 fps

int pX = 16;
int pY = 16;
int pW = 32;
int pH = 32;

int screen;
PImage titlescreen;

void settings() {
  size(512, 572);
}

void setup() {
  background(0);
  frameRate(60);
  noStroke();
  surface.setTitle("Echoes");
  screen = 1;
  titlescreen = loadImage("titlescreen.png");
}

void startCircles(int startX, int startY) {
  //fill start x and y location of each circle
  for (int i = 0; i < 8; i++) {
    circlesX[i] = startX + 16;
    circlesY[i] = startY + 16;
  }
}

void drawCircles() {
  //draws all circles
  for (int i = 0; i < 8; i++) {
    ellipse(circlesX[i], circlesY[i], 5, 5);
  }
}

void updateCircles() {
  //change their positions
  if (!detectCircleHit(circlesX[0], circlesY[0]) && circlesY[0] > 0) {
    circlesY[0]--;
  }
  if (!detectCircleHit(circlesX[1], circlesY[1]) && circlesX[1] < 512 && circlesY[1] > 0) {
    circlesX[1]++;
    circlesY[1]--;
  }
  if (!detectCircleHit(circlesX[2], circlesY[2]) && circlesX[2] < 512) {
    circlesX[2]++;
  }
  if (!detectCircleHit(circlesX[3], circlesY[3]) && circlesX[3] < 512 && circlesY[3] < 512) {
    circlesX[3]++;
    circlesY[3]++;
  }
  if (!detectCircleHit(circlesX[4], circlesY[4]) && circlesY[4] < 512) {
    circlesY[4]++;
  }
  if (!detectCircleHit(circlesX[5], circlesY[5]) && circlesX[5] > 0 && circlesY[5] < 512) {
    circlesX[5]--;
    circlesY[5]++;
  }
  if (!detectCircleHit(circlesX[6], circlesY[6]) && circlesX[6] > 0) {
    circlesX[6]--;
  }
  if (!detectCircleHit(circlesX[7], circlesY[7]) && circlesX[7] > 0 && circlesY[7] > 0) {
    circlesX[7]--;
    circlesY[7]--;
  }
}

void detectPlayerHit() {
  for (int i = 0; i < 64; i++) {
    if (rectRect(pX, pY, pW, pH, tiles[i].x, tiles[i].y, tiles[i].size, tiles[i].size)) {
      if (!tiles[i].traversable) {
        pX = 16;
        pY = 16;
      }
    }
  }
}

boolean detectCircleHit(int cX, int cY) {
  for (int i = 0; i < 64; i++) {
    if (circleRect(cX, cY, 5, tiles[i].x, tiles[i].y, tiles[i].size, tiles[i].size)) {
      if (!tiles[i].traversable) {
        return true;
      }
    }
  }
  return false;
}




//CREDIT TO JEFFERY THOMPSON'S COLLISION DETECTION
// RECTANGLE/RECTANGLE
boolean rectRect(int pX, int pY, int pW, int pH, int mX, int mY, int mH, int mW) {

  // are the sides of one rectangle touching the other?

  if (pX + pW >= mX &&    // r1 right edge past r2 left
    pX <= mX + mW &&    // r1 left edge past r2 right
    pY + pH >= mY &&    // r1 top edge past r2 bottom
    pY <= mY + mH) {    // r1 bottom edge past r2 top
    return true;
  }
  return false;
}

//MORE CREDIT TO JEFFERY THOMPSON'S COLLISON DETECTION
// CIRCLE/RECTANGLE
boolean circleRect(float cx, float cy, float radius, float mX, float mY, float mW, float mH) {

  // temporary variables to set edges for testing
  float testX = cx;
  float testY = cy;

  // which edge is closest?
  if (cx < mX)         testX = mX;      // test left edge
  else if (cx > mX+mW) testX = mX+mW;   // right edge
  if (cy < mY)         testY = mY;      // top edge
  else if (cy > mY+mH) testY = mY+mH;   // bottom edge

  // get distance from closest edges
  float distX = cx-testX;
  float distY = cy-testY;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  // if the distance is less than the radius, collision!
  if (distance <= radius) {
    return true;
  }
  return false;
}


void draw() {
  if (screen == 1) {
    image(titlescreen, 0, 0);
    if (keyPressed) {
      if (key == ENTER || key == RETURN) {
        screen = 2;
      }
    } 
  }
    if (screen  == 2) {
      background(0);
      maze.drawMaze();
      //draw background to "refresh" screen

      //draw player
      pushStyle();
      fill(255, 180, 0);
      rect(pX, pY, pW, pH);
      popStyle();
      fill(255);
      detectPlayerHit();

      //control inputs
      if (keyPressed) {
        if (key == 'w') {
          if (pY > 0) {
            pY -= 1;
          }
        }
        if (key == 'a') {
          if (pX > 0) {
            pX -= 1;
          }
        }
        if (key == 's') {
          if (pY < 480) {
            pY += 1;
          }
        }
        if (key == 'd') {
          if (pX < 480) {
            pX += 1;
          }
        }
        if (key == ' ' && circlesActive == false) {
          circlesActive = true;
          circleTimer = 180;
          startCircles(pX, pY);
        }
      }

      if (circlesActive == true && circleTimer > 0) {
        drawCircles();
        updateCircles();
        circleTimer--;
        if (circleTimer == 0) {
          circlesActive = false;
        }
      }
    }
  }
