import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';

class YoutubeVideoPage extends StatefulWidget {
  final YouTubeVideo video;
  const YoutubeVideoPage({Key? key, required this.video}) : super(key: key);

  @override
  State<YoutubeVideoPage> createState() => _YoutubeVideoPageState();
}

class _YoutubeVideoPageState extends State<YoutubeVideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
