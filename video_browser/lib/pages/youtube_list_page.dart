import 'package:flutter/material.dart';
import 'package:video_browser/model/videos.dart';
import 'package:video_browser/pages/youtube_video_page.dart';
import 'package:youtube_api/youtube_api.dart';

import '../model/user.dart';
import '../utilities/constants.dart';

class YoutubeListPage extends StatefulWidget {
  final User user;
  const YoutubeListPage({Key? key, required this.user}) : super(key: key);

  @override
  State<YoutubeListPage> createState() => _YoutubeListPageState();
}

class _YoutubeListPageState extends State<YoutubeListPage> {
  late Future<List<YouTubeVideo>> videoResult;

  @override
  void initState() {
    videoResult = searchYoutubeVideoList(); //trendsYoutubeVideoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Youtube API'),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Text('User: ${widget.user.login}}'),
            const SizedBox(height: 20),
            Expanded(
              child: _videoListForm(),
            )
          ],
        ),
      ),
    );
  }

  Widget _videoListForm() {
    return FutureBuilder<List<YouTubeVideo>>(
      future: videoResult,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return Card(
                child: _videoListTile(snapshot.data?[index] as YouTubeVideo),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Text('Error');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _videoListTile(YouTubeVideo video) {
    return GestureDetector(
      onTap: () {
        print('Video ${video.id} - ${video.title} was pressed');
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => YoutubeVideoPage(video: video)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Image.network(
                video.thumbnail.small.url ?? '',
                width: 120.0,
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  video.title,
                  softWrap: true,
                  style: myVideoTitleStyle,
                ),
                const SizedBox(height: 5),
                Text(
                  video.channelTitle,
                  softWrap: true,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  video.publishedAt != null
                      ? video.publishedAt!.split('T')[0]
                      : '',
                  softWrap: true,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
