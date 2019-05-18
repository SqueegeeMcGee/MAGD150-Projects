// setting up background
void setup(){
  String s = "the canvas size is ";
  String C = "and the canvas color is ";
  int w = 400;
  int h = 400;
  int c = 0;
  size(400, 400);
  background(c, c, c);
  println(s);
  println(w, "x", h);
  println(C);
  println("Red = " + c);
  println("Blue = " + c);
  println("Green = " + c);
  int Clicks = 0;
  
}

// void draw, adding a white ellipse as a center ring for stability in the image
void draw(){
  ellipseMode(CORNERS);
  noFill();
  stroke(0, millis()%256, 200);
// colors made with neon effect by calculating the 256 modulo of milliseconds elapsed
// as a side note, how does one phrase "modulo" in a sentence..? 256th modulo of x?
// modulo 256 of x? 256 modulo x?
  ellipse(mouseX-75, mouseY-75, mouseX-25, mouseY-25);
  stroke(0, 200, millis()%256);
  ellipse(mouseX-25, mouseY-75, mouseX+25, mouseY-25);
  stroke(millis()%256, 0, 200);
  ellipse(mouseX-75, mouseY-25, mouseX-25, mouseY+25);
  stroke(150, millis()%256, 200);
  ellipse(mouseX-25, mouseY-25, mouseX+25, mouseY+25);
}

// we create four bezier's relative to the screen dimensions.
// anchor points are the same, creating a loop.
int ClickTotal = 0;
String M = "Canvas has been reset ";
/* this tiny section of code was the most difficult part to figure out.
i'm not even entirely sure why this works, but the goal was to have a counter
which increased by one every time the mouse was pressed, to represent
how many times the canvas has been reset.
it seems that placing the integer outside the void command finally allowed
the increment to remain permanent and assign to the integer after printing
the string. when placing the int value within the void, it would reset
as a result of being called every frame, setting the integer back to 0 after
each increment. */
void mousePressed(){
  background(0);
  noFill();
  stroke(millis()%256, 0, 200);
  bezier(width/2, height/2, 25, 162, 151, 50, width/2, height/2);
  stroke(0, 200, millis()%256);
  bezier(width/2, height/2, 382, 168, 267, 33, width/2, height/2);
  stroke(millis()%256, 0, 200);
  bezier(width/2, height/2, 382, 259, 267, 398, width/2, height/2);
  stroke(150, millis()%256, 200);
  bezier(width/2, height/2, 25, 259, 160, 398, width/2, height/2);
// now for the ClickTotal variable increment. . .
/* frankly, i have absolutely no idea how to incorporate anything other
than the constrain function as far as the trigonomic requirements go.
to compensate, here's a tiny little "if" function. i've tried a few, but 
i haven't been able to figure out how to cleverly and/or creatively integrate
functions like min(), max(), map(), dist(), or lerp().*/
  ClickTotal++;
  println(M + ClickTotal + " times so far.");
  if (ClickTotal >= 35){
    println("Maybe relax a little bit..");
    println("You've more than likely seen everything this code has to offer by now.");
  }
// creating a large white ellipse in the center of the screen after the mouse is
// pressed by constraining the corner values. wanted to make it move around 
// a bit more but this is actually functional so i'll take it.
  noFill();
  stroke(255);
  float lCornerX = constrain(width, 100, 100);
  float lCornerY = constrain(height, 100, 100);
  float rCornerX = constrain(width, 300, 300);
  float rCornerY = constrain(height, 300, 300);
  ellipse(lCornerX, lCornerY, rCornerX, rCornerY);
}
