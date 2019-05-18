//TO DO: 1). ADD ONE MORE Primitive or PShape 
// 2.) Make the 2D Texture and import image to this project's data folder
/* 
 1. Import a pixel art image using image processing. Scale this image up
 two times, and then save it into the image library. This is the texture.
 2. Set up a space using Ambient and Point Light, with the position
 of the light adjusting depending on arrow presses.
 3. Set up a cube two times the size of the initial image. Place this in the
 middle of the canvas.
 4. Rotate the image based on the X and Y position of the mouse.
 */

float ambL1, ambL2, ambL3, ambx1, amby1, ambz1, ambx2, amby2, ambz2;
float ptL1, ptL2, ptL3, ptx1, pty1, ptz1, ptx2, pty2, ptz2;
float dirL1, dirL2, dirL3, dirx1, diry1, dirz1, dirx2, diry2, dirz2;
float xRotation, yRotation, u, v, uOffset, vOffset, camSpeed, 
  x, y, z, lookAtX, lookAtY, lookAtZ, upX, upY, upZ;
float extents = 250;
int rate, colorMode;
PImage texture;

void setup() {
  pixelDensity(displayDensity()); // no idea what this is used for.
  size(500, 500, P3D);
  background(0);
  noStroke();
  texture = loadImage("textureMap.png");
  uOffset = 0;
  vOffset = 0;
  u = 1;
  v = 1;
  camSpeed = 5.0;
  x = width / 2.0;
  y = height / 2.0;
  z =  (height / 2.0) / tan(PI * 60.0 / 360.0);
  lookAtX = x;
  lookAtY = y;
  lookAtZ = 0;
  upX = 0;
  upY = 1;
  upZ = 0;
  textureMode(NORMAL);
  textureWrap(REPEAT);

  // ambient light setup
  ambL1 = random(0, 156);
  ambL2 = random(0, 156);
  ambL3 = random(0, 156);
  ambx1 = random(0, width);
  amby1 = random(0, height);
  ambz1 = 0;

  // point light setup
  ptL1 = random(0, 156);
  ptL2 = random(0, 156);
  ptL3 = random(0, 156);
  ptx1 = random(0, width);
  pty1 = random(0, height);
  ptz1 = 0;

  // directional light setup
  dirL1 = random(0, 100);
  dirL2 = random(0, 100);
  dirL3 = random(0, 100);
  dirx1 = random(-1, 1);
  diry1 = random(-1, 1);
  dirz1 = random(-1, 1);

  rate = 100;
  colorMode = RGB;
}

void draw() {
  background(0);
  // sourced from 9.5, MovieScrub.
  float ratioX = mouseX / (float) width;
  float ratioY = mouseY / (float) height;
  background(0);
  ambientLight(ambL1, ambL2, ambL3, ambx1, amby2, ambz1);
  pointLight (ptL1, ptL2, ptL3, ptx1, pty1, ptz1);
  // sourced from Example 10.5 in order to gain a base understanding
  // of the 3D space before adding in required features.

  camera(x, y, z, lookAtX, lookAtY, lookAtZ, upX, upY, upZ);


  pushMatrix();
  translate(width * .1, height / 2.0, -height / 7.0); 
  // why do 3D shapes have to be translated? 
  rotateX(ratioY * 2.5);
  rotateY(ratioX * 2.5);
  // not sure why, but those two had to be reversed in order to achieve the desired
  // effect... Perhaps because moving the mouse horizontally across the canvas
  // was rolling the cube AROUND the X axis like it was an axel, rather than twisting
  // the cube horizontally..
  box(25);
  popMatrix();
  
  pushMatrix();
  translate(width * .9, 2*height / 3, -height / 12.0);
  sphere(43);
  popMatrix();
  // currently, there are no examples of shadows within the 3D space, despite
  // having three separate light sources. does the function lights(); need to be called?

  pushMatrix();

  noStroke();
  translate(width/2, height/2, -500);
  rotateX(xRotation);
  rotateY(yRotation);
  scale(min(width, height) / 2.0);
  xRotation = map(mouseY, -height * 0.5, height * 0.5, 0, TWO_PI);
  yRotation = map(mouseX, -width  * 0.5, width  * 0.5, 0, TWO_PI);

  //  front

  beginShape();
  texture(texture);
  vertex(-1, -1, 1, uOffset, vOffset);
  vertex(1, -1, 1, uOffset + u, vOffset);
  vertex(1, 1, 1, uOffset + u, vOffset + v);
  vertex(-1, 1, 1, uOffset, vOffset + v);
  endShape(CLOSE);


  beginShape();
  texture(texture);
  vertex(1, -1, 1, uOffset, vOffset);
  vertex(1, -1, -1, uOffset + u, vOffset);
  vertex(1, 1, -1, uOffset + u, vOffset + v);
  vertex(1, 1, 1, uOffset, vOffset + v);
  endShape(CLOSE);

  beginShape();
  texture(texture);
  vertex(1, -1, -1, uOffset, vOffset);
  vertex(-1, -1, -1, uOffset + u, vOffset);
  vertex(-1, 1, -1, uOffset + u, vOffset + v); 
  vertex(1, 1, -1, uOffset, vOffset + v);
  endShape(CLOSE);

  beginShape();
  texture(texture);
  vertex(-1, -1, -1, uOffset, vOffset);
  vertex(-1, -1, 1, uOffset + u, vOffset);
  vertex(-1, 1, 1, uOffset + u, vOffset + v);
  vertex(-1, 1, -1, uOffset, vOffset + v);
  endShape(CLOSE);

  beginShape();
  texture(texture);
  vertex(-1, 1, 1, uOffset, vOffset);
  vertex(1, 1, 1, uOffset + u, vOffset);
  vertex(1, 1, -1, uOffset + u, vOffset + v);
  vertex(-1, 1, -1, uOffset, vOffset + v);
  endShape(CLOSE);

  beginShape();
  texture(texture);
  vertex(-1, -1, -1, uOffset, vOffset);
  vertex(1, -1, -1, uOffset + u, vOffset);
  vertex(1, -1, 1, uOffset + u, vOffset + v);
  vertex(-1, -1, 1, uOffset, vOffset + v);
  endShape(CLOSE);  
  popMatrix();

  keys();
}
void keys() {
  if (keyPressed) {
    if (y > 0
      && (key == 'w' || key == 'W' || keyCode == UP)) {
      y -= camSpeed;
      lookAtY = y;
    }
    if (x > -extents
      && (key == 'a' || key == 'A' || keyCode == LEFT)) {
      x -= camSpeed;
      lookAtX = x;
    }
    if (y < height - 10
      && (key == 's' || key == 'S' || keyCode == DOWN)) {
      y += camSpeed;
      lookAtY = y;
    }
    if (x < extents
      && (key == 'd' || key == 'D' || keyCode == RIGHT)) {
      x += camSpeed;
      lookAtX = x;
    }
  }
}

// the following is also sourced from the 10.5 example. I don't really know what
// I'm doing, so I'm mostly trying to piece together my own project based on
// framework from the assignment examples.
void mousePressed() {
  ambL1 = random(0, 156);
  ambL2 = random(0, 156);
  ambL3 = random(0, 156);
  println("ambientLight values are now... " + hex(color(ambL1, ambL2, ambL3)).substring(2));
  ptL1 = random(0, 156);
  ptL2 = random(0, 156);
  ptL3 = random(0, 156);
  println("pointLight values are now... " + hex(color(dirL1, dirL2, dirL3)).substring(2));
  dirL1 = random(0, 156);
  dirL2 = random(0, 156);
  dirL3 = random(0, 156);
  println("directionalLight values are now... " + hex(color(dirL1, dirL2, dirL3)).substring(2));
}
