abstract class UndersnorePlayer {
  Future<void> initialize();
  Future<void> finalize();

  Future<Duration?> play(String? path, Function? onFinished);
  Future<String?> stop();
  void record();

  void seek(Duration duration);
  void pause();
}