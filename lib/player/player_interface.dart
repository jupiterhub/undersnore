abstract class UndersnorePlayer {
  Future<void> initialize();
  Future<void> finalize();

  Future<Duration?> play(String? path, Function? onFinished);
  Future<String?> stop();
  Future<void> record(String? path);

  Future<void> seek(Duration duration);
  Future<void> pause();
}