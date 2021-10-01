import 'dart:async';

import 'package:flutter/material.dart';
import 'package:record/record.dart';

class AudioRecorder extends StatefulWidget {
  final void Function(String? path) onStop;

  const AudioRecorder({Key? key, required this.onStop}): super(key: key);

  @override
  _AudioRecorderState createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  bool _isRecording = false;
  Timer? _timer;
  int _recordDurationInSeconds = 0;
  final _audioRecorder = Record();

  @override
  void dispose() {
    _audioRecorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _recordDurationInSeconds++;
      });
    });
  }

  Future<void> start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        await _audioRecorder.start();

        bool isRecording = await _audioRecorder.isRecording();
        setState(() {
          _isRecording = _isRecording;
          _recordDurationInSeconds = 0;
        });

        _startTimer();
      }
    } catch (e) {
      // TODO: refactor
      print(e);
    }
  }

  Future<void> stop() async {
    _timer?.cancel();
    final path = await _audioRecorder.stop();

    widget.onStop(path);
    setState(() {
      _isRecording = false;
    });

    _startTimer();
  }
}
