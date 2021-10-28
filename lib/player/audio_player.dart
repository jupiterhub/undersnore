import 'package:flutter/material.dart';
import 'package:undersnore/player/player_interface.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioPlayer extends StatefulWidget {
  const AudioPlayer({Key? key, required this.audioPlayer, required this.title})
      : super(key: key);

  final UndersnorePlayer audioPlayer;
  final String title;

  @override
  _AudioPlayerState createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  bool _playerInitialized = false;
  bool _isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: [
            const Text("Press button to record"),
            Text('Player initialized? $_playerInitialized'),
            Text('Recording started initialized? $_isRecording'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _record,
        tooltip: 'Record',
        child: _isRecording
            ? const Icon(Icons.stop)
            : const Icon(Icons.mic),
      ),
    );
  }

  @override
  void initState() {
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ STARTING INIT STATE');
    super.initState();
    widget.audioPlayer.initialize().then((value) {
      print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ INITIALIZED STATE');

      setState(() {
        _playerInitialized = true;
      });
    });
  }

  @override
  void dispose() {
    widget.audioPlayer.finalize();
    super.dispose();
  }

  void _record() async {
    await widget.audioPlayer.record("sample_file.mp4").then((value) => {
          setState(() {
            print("----- START RECORDING ---");
            _isRecording = true;
          })
        });
  }
}
