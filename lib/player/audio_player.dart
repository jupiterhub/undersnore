import 'package:flutter/material.dart';
import 'package:undersnore/player/player_interface.dart';

class AudioPlayer extends StatefulWidget {
  const AudioPlayer({Key? key, required this.audioPlayer}) : super(key: key);

  final UndersnorePlayer audioPlayer;

  @override
  _AudioPlayerState createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> implements UndersnorePlayer {
  bool _playerInitialized = false;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    super.initState();
    initialize().then((value) => _playerInitialized = true);
  }

  @override
  void dispose() {
    finalize();
    super.dispose();
  }

  @override
  Future<Duration?> play(String? path, Function? onFinished) {
    return widget.audioPlayer.play(path, onFinished);
  }

  @override
  Future<void> seek(Duration duration) {
    return widget.audioPlayer.seek(duration);
  }

  @override
  Future<void> record(String? path) {
    return widget.audioPlayer.record(path);
  }

  @override
  Future<String?> stop() {
    return widget.audioPlayer.stop();
  }

  @override
  Future<void> pause() {
    return widget.audioPlayer.pause();
  }

  @override
  Future initialize() {
    return widget.audioPlayer.initialize();
  }

  @override
  Future<void> finalize() {
    return widget.audioPlayer.finalize();
  }
}
