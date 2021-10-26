import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:undersnore/player/player_interface.dart';

class AudioPlayerFlutterSound implements UndersnorePlayer {
  FlutterSoundPlayer? _flutterSoundPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder? _flutterSoundRecorder = FlutterSoundRecorder();

  @override
  Future initialize() async {
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ INITIALIZING AUDIO SESSION');
    await _flutterSoundPlayer!.openAudioSession();
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ OPENING RECORDER');
    await openTheRecorder();
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ RECORDER OPEN');
    return Future<void>.value();
  }

  Future<void> openTheRecorder() async {
    var status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }
    await _flutterSoundRecorder!.openAudioSession();
  }

  @override
  Future<void> finalize() {
    if (_flutterSoundPlayer != null) {
      _flutterSoundPlayer!.closeAudioSession();
      _flutterSoundPlayer = null;
    }

    if (_flutterSoundRecorder != null) {
      _flutterSoundRecorder!.closeAudioSession();
      _flutterSoundRecorder = null;
    }

    return Future<void>.value();
  }

  @override
  Future<Duration?> play(String? path, Function? onFinished) {
    // TODO: identify codec to use based on path
    return _flutterSoundPlayer!.startPlayer(
        fromURI: path,
        codec: Codec.mp3,
        whenFinished: onFinished != null ? onFinished() : null);
  }

  @override
  Future<void> record(String? path) {
    // TODO: identify codec to use based on path
    return _flutterSoundRecorder!.startRecorder(toFile: path, codec: Codec.mp3);
  }

  @override
  Future<void> pause() {
    return _flutterSoundPlayer!.pausePlayer();
  }

  @override
  Future<void> seek(Duration duration) {
    return _flutterSoundPlayer!.seekToPlayer(duration);
  }

  @override
  Future<String?> stop() async {
    await _flutterSoundPlayer!.stopPlayer();
    return await _flutterSoundRecorder!.stopRecorder();
  }
}
