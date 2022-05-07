import 'package:flutter/material.dart';
import 'package:video_browser/model/videos.dart';
import 'package:video_browser/pages/video_page.dart';

import '../model/user.dart';

class UserInfoPage extends StatefulWidget {
  final User user;
  const UserInfoPage({Key? key, required this.user}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPage();
}

class _UserInfoPage extends State<UserInfoPage> {
  late Future<VideoList> videoList;
  String url = '';

  @override
  void initState() {
    super.initState();
    videoList = getVideoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Videos'),
        centerTitle: true,
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
    return FutureBuilder<VideoList>(
      future: videoList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data?.videos.length,
            itemBuilder: (context, index) {
              return Card(
                child: _videoListTile(snapshot.data?.videos[index] as Video),
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

  Widget _videoListTile(Video video) {
    return ListTile(
      //leading: Image.network(
      //    'https://i.vimeocdn.com/video/${video.picture_id}._100x75.jpg'),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          video.userImage != ''
              ? CircleAvatar(
                  backgroundImage: NetworkImage(video.userImage),
                  radius: 15,
                )
              : const Icon(Icons.person),
          const SizedBox(width: 10),
          Text(video.user),
        ],
      ),

      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.remove_red_eye,
            color: Colors.grey,
          ),
          Text(video.views.toString()),
          const Icon(
            Icons.thumb_up_alt_outlined,
            color: Colors.blue,
          ),
          Text(video.likes.toString()),
          const Icon(
            Icons.messenger_outline,
            color: Colors.grey,
          ),
          Text(video.comments.toString()),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VideoPage(video: video)),
        );
      },
    );
  }
}
