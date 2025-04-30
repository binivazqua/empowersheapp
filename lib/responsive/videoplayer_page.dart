import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player Test',
      theme: ThemeData.dark(),
      home: const VideoPlayerTestPage(),
    );
  }
}

class VideoPlayerTestPage extends StatefulWidget {
  const VideoPlayerTestPage({super.key});

  @override
  State<VideoPlayerTestPage> createState() => _VideoPlayerTestPageState();
}

class _VideoPlayerTestPageState extends State<VideoPlayerTestPage> {
  late VideoPlayerController _controller;
  bool ver_resumen = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('lib/assets/videotest.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => _controller.play()); // play/pause controllers
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildControls() {
    final isPlaying = _controller.value.isPlaying;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        VideoProgressIndicator(
          // rayita que indica el progreso
          _controller,
          allowScrubbing: true,
          colors: VideoProgressColors(
            playedColor: Colors.red,
            backgroundColor: Colors.grey,
            bufferedColor: Colors.white70,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: () {
                isPlaying ? _controller.pause() : _controller.play();
              },
            ),
            Text(
              _formatDuration(_controller.value.position) +
                  ' / ' +
                  _formatDuration(_controller.value.duration),
            ),
          ],
        ),
      ],
    );
  }

  // función que crea el formato de tiempo del video.
  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  bool isPressed_1 = false;
  bool isPressed_2 = false;
  bool isPressed_3 = false;
  bool isPressed_4 = false;
  bool isPressed_5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Empower She"),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 1000,
                      child: AspectRatio(
                        // showcase video
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                    child: _buildControls(),
                    visible: ver_resumen,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ver_resumen = true;
                          print(ver_resumen);
                        });
                      },
                      child: Text('Ver Resumen')),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Título de la lección',
                          style: TextStyle(fontSize: 50),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPressed_1 = !isPressed_1;
                                  });
                                  print(isPressed_1.toString());
                                },
                                icon: Icon(
                                  isPressed_1
                                      ? Icons.star_rate_rounded
                                      : Icons.star_border_rounded,
                                  size: 40,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPressed_2 = !isPressed_2;
                                  });
                                  print(isPressed_2.toString());
                                },
                                icon: Icon(
                                  isPressed_2
                                      ? Icons.star_rate_rounded
                                      : Icons.star_border_rounded,
                                  size: 40,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPressed_3 = !isPressed_3;
                                  });
                                  print(isPressed_3.toString());
                                },
                                icon: Icon(
                                  isPressed_3
                                      ? Icons.star_rate_rounded
                                      : Icons.star_border_rounded,
                                  size: 40,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPressed_4 = !isPressed_4;
                                  });
                                  print(isPressed_4.toString());
                                },
                                icon: Icon(
                                  isPressed_5
                                      ? Icons.star_rate_rounded
                                      : Icons.star_border_rounded,
                                  size: 40,
                                )),
                          ],
                        ),
                        Text(
                          'Tiempo estimado',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Nivel educativo estimado',
                          style: TextStyle(fontSize: 30),
                        )
                      ],
                    ),
                  )
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
