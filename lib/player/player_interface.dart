abstract class UndersnorePlayer {
  Future initialize();
  void finalize();

  void play(String? path);
  void seek(Duration duration);
  void pause();
  void stop();
  void record();
}