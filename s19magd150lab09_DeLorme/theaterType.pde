class theaterType {

  void emptyTheater() {
    image(backdrop, 0, 0);
  }

  void playTheater() {
    image(backdrop, 0, 0);
    image(sekiro, 160, 90, 961, 541);
    sekiro.play();
  }

  void playVOTheater() {
    image(backdrop, 0, 0);
    image(sekiro, 160, 90, 961, 541);
    voiceOver.play();
  }

  void playReverbTheater() {
    image(backdrop, 0, 0);
    image(sekiro, 160, 90, 961, 541);
    voiceOver.play();
    reverb.process(voiceOver);
  }

  void cancelTheater() {
    sekiro.stop();
    image(backdrop, 0, 0);
  }
}
