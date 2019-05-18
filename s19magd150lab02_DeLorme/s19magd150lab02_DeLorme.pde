// canvas to spill noodles on
// bit of a darker sky, looks kinda cloudy. maybe windy?
void setup() {
  size(300, 300);
  background(255);
}
// introducing stroke, weight, and color of first balloon
// no idea where this thing is gonna go yet, gonna figure that out as i go
// balloon hole and string
void draw() {
  strokeWeight(2);
  stroke(255);
  noFill();
  bezier(235, 225, 195, 300, 265, 280, 235, 300);
  strokeWeight(3);
  stroke(0, 0, 100);
  fill(0, 10, 185);
  quad(215, 225, 235, 225, 245, 250, 205, 250); 
  arc(225, 160, 150, 150, 0, TWO_PI);
  // this arc's outer edges are somewhere around (150, 160) and (310, 160)
  // and (225, 225), (225, 160). hard to estimate since it's an arc and i'm not
  // even sure the width and height of the subsequent eclipse is being read
  // how i think it is
  noStroke();
  fill(255, 255, 255, 185);
  //ellipse(185, 130, 25, 25); // problem!!!!!!!
  fill(255, 255, 255, 155);
  //ellipse(205, 110, 10, 10); // problem!!!!!!!

  // the other balloon, gonna try and make this one a funky shape
  stroke(255);
  strokeWeight(1);
  noFill();
  bezier(55, 73, 93, 137, 25, 119, 55, 170);
  stroke(120, 0, 0);
  fill(180, 0, 0);
  quad(55, 75, 65, 75, 70, 85, 50, 85);
  triangle(35, 80, 60, 50, 85, 80);
  noStroke();
  fill(255, 255, 255, 155);
  ellipseMode(CORNERS);
  ellipse(55, 56, 60, 61);

  // sun's out bloons out
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  fill(44, 97, 100, 20);
  ellipse(225, -10, 315, 80); 
  colorMode(RGB);
  strokeWeight(3);
  stroke(#FF9100);
  fill(#FFFF00);
  ellipse(245, 10, 295, 60);
}

void keyPressed() {
  if (key == 'S' || key == 's') {
    save("textureMap.png");
    println("The image has been saved.");
  } else {
  }
}

// i'd totally make some clouds but i'm running low on time, and i have
// no idea how to make a complex shape like that without spending an hour on it.

// that's all for this one, i think. that should cover all the requirements.
