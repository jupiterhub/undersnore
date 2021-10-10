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
  void play(String? path) {
    widget.audioPlayer.play(path);
  }

  @override
  void seek(Duration duration) {
    widget.audioPlayer.seek(duration);
  }

  @override
  void record() {
    widget.audioPlayer.record();
  }

  @override
  void stop() {
    widget.audioPlayer.stop();
  }

  @override
  void finalize() {
    widget.audioPlayer.finalize();
  }

  @override
  Future initialize() {
    return widget.audioPlayer.initialize();
  }

  @override
  void pause() {
    widget.audioPlayer.pause();
  }

}