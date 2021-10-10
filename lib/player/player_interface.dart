abstract class UndersnorePlayer {
  Future initialize();
  void finalize();

  void play(String? path, Function? onFinished);
  void seek(Duration duration);
  void pause();
  void stop();
  void record();
}