

import 'package:flutter/foundation.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';
import 'package:undersnore/player/player_interface.dart';

class AudioPlayerFlutterSound implements UndersnorePlayer {
  FlutterSoundPlayer? _flutterSoundPlayer = FlutterSoundPlayer();

  @override
  void finalize() {
    stopPlayer();
    _flutterSoundPlayer!.closeAudioSession();
    _flutterSoundPlayer = null;
  }

  Future<void> stopPlayer() async {
    if (_flutterSoundPlayer != null) {
      await _flutterSoundPlayer!.stopPlayer();
    }
  }

  @override
  Future initialize() {
    return _flutterSoundPlayer!.openAudioSession();
  }

  @override
  void play(String? path, Function? onFinished) {
    // TODO: identify codec to use based on path
    _flutterSoundPlayer!.startPlayer(
      fromURI: path,
      codec: Codec.mp3,
      whenFinished: onFinished != null ? onFinished() : null
    );
  }

  @override
  void pause() {
    // TODO: implement pause
  }

  @override
  void record() {
    // TODO: implement record
  }

  @override
  void seek(Duration duration) {
    // TODO: implement seek
  }

  @override
  void stop() {
    // TODO: implement stop
  }
  
}