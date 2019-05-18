theaterType tT = new theaterType();

import processing.video.*; // importing video library
import processing.sound.*; // importing sound library

PImage backdrop; // declaring Image
PImage backdrop2; // loud image
Movie sekiro; // delcaring "Movie" object from class
SoundFile voiceOver;
//SoundFile voiceOver
Reverb reverb;
// comment

void setup() {
  size(1280, 720); 
  // adjusted size for the theater backdrop video
  // video itself will fit into 960x540 frame
  backdrop = loadImage("theaterBackdrop.png");
  backdrop2 = loadImage("theaterBackdropLOUD.png");
  sekiro = new Movie(this, "JUMPKICKclip.mov");
  voiceOver = new SoundFile(this, "ShinobiREC.wav");
  reverb = new Reverb(this);
}

void movieEvent(Movie sekiro) {
  sekiro.read();
}

void draw() {
  image(backdrop, 0, 0);
  if (keyPressed) {
    if (key == ENTER) {
      tT.cancelTheater();
    }
    if (key == TAB) {
      tT.playTheater();
    } else if (key == 'Q' || key == 'q') {
      tT.playVOTheater();
    } else if (key == 'R' || key == 'r') {
      tT.playReverbTheater();
    }
  }
}
