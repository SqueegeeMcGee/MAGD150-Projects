// setting up canvas color and size. easy peasy.
size(384, 384);
background(0);

/* stars come first because they're really, really far away. even though i'm
writing this part of the code after the two planets. conveniently, this
means it uses the default mode which I was gonna use anyways. */
fill(255);
ellipse(12, 25, 3, 3);
ellipse(45, 65, 8, 8);
ellipse(75, 69, 2, 2);
ellipse(150, 70, 1, 1);
ellipse(190, 33, 3, 3);
ellipse(85, 35, 10, 10);
ellipse(100, 87, 5, 5);
ellipse(154, 78, 7, 7);
ellipse(179, 95, 6, 6);
ellipse(204, 130, 4, 4);
ellipse(35, 163, 4, 4);
// i'm now realizing this is going to be a helluva lot of stars to make.
ellipse(235, 33, 3, 3);
ellipse(350, 35, 10, 10);
ellipse(320, 87, 5, 5);
ellipse(284, 45, 15, 15);
ellipse(218, 70, 6, 6);
ellipse(350, 130, 4, 4);
ellipse(260, 81, 2, 2);
ellipse(290, 142, 9, 9);
ellipse(128, 121, 6, 6);
// god damn holy smokes
ellipse(55, 240, 2, 2);
ellipse(28, 210, 9, 9);
ellipse(79, 223, 4, 4);
ellipse(60, 140, 7, 7);
point(35, 70);
ellipse(189, 231, 3, 3);
ellipse(162, 201, 5, 5);
ellipse(213, 193, 2, 2);
ellipse(250, 176, 8, 8);
ellipse(283, 209, 3, 3);
ellipse(364, 245, 1, 1);
ellipse(380, 222, 7, 7);
ellipse(202, 185, 5, 5);
// make it stop this is so tedious
ellipse(12, 286, 2, 2);
ellipse(45, 254, 6, 6);
ellipse(75, 311, 3, 3);
ellipse(150, 231, 4, 4);
point(190, 367);
ellipse(85, 365, 10, 10);
ellipse(100, 305, 5, 5);
ellipse(154, 323, 7, 7);
ellipse(179, 351, 6, 6);
ellipse(204, 333, 4, 4);
ellipse(250, 305, 5, 5);
ellipse(279, 346, 7, 7);
ellipse(215, 299, 6, 6);
ellipse(300, 300, 4, 4);
ellipse(340, 311, 2, 2);
ellipse(317, 275, 5, 5);
ellipse(361, 249, 3, 3);
ellipse(374, 291, 9, 9);
//ellipse(155, 150, 12, 15);
// holy mother of god fINALLY DONE WITH THE STUPID ATMOSPHERE

// making the dipper constellation
stroke(255);
line(100, 87, 154, 78);
line(154, 78, 179, 95);
line(179, 95, 128, 121);
line(128, 121, 100, 87);
line(128, 121, 60, 140);

//setting up orbital ellipse
ellipseMode(CORNERS);
/* ellipseMode CORNERS used since it's easiest for me to visualize the 
orbit as a rectangle in this case */
stroke(40);
strokeWeight(1);
noFill();
ellipse(0, 180, 384, 256);

/* placing the two planets on the orbital line, using ellipseMode CORNER
in order to more easily visualize the size difference between the two ellipses */
ellipseMode(CORNER);
stroke(40);
fill(40);
ellipse(50, 168, 40, 40);

stroke(100);
fill(100);
ellipse(250, 215, 70, 70);
// i gave the big planet a moon because it seemed a bit lonely
/* i'm getting kind of sick of writing a separate stroke and fill every time the
ellipse changes colors though, all because I wrote the orbital ellipse first */
// after tweaking the dimensions for like a hundred white circles individually, i take that back
// also i forgot i could noStroke. duh.
noStroke();
fill(75);
ellipse(225, 212, 15, 15);

// making the spaceship, first comes wings and head so they're obstructed from view
noStroke();
fill(125);
triangle(25, 270, 55, 270, 40, 240);
fill(140);
triangle(65, 287, 65, 307, 95, 297);
fill(140);
triangle(15, 287, 15, 307, -15, 297);
// time to build the actual ship
rectMode(CORNERS);
stroke(150);
fill(150);
rect(15, 265, 65, 350, 6);
stroke(100);
fill(100);
rect(15, 330, 65, 350, 6);
ellipseMode(CORNERS);
stroke(255);
fill(255);
ellipse(20, 335, 35, 345);
ellipse(45, 335, 60, 345);
// lights, camera, just lights actually
stroke(255);
point(40, 271);
point(40, 287);
point(40, 303);
point(40, 319);

// all done!
