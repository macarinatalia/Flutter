import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../model/videos.dart';
import 'package:pod_player/pod_player.dart';

class VideoPage extends StatefulWidget {
  final Video video;
  const VideoPage({Key? key, required this.video}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late final PodPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.vimeo(widget.video.url),
    )..initialise();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            PodVideoPlayer(controller: _controller),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
