abstract class Player {
  void initialize();
  void finalize();

  void play(String? path);
  void seek(Duration duration);
  void pause();
  void stop();
  void record();
}