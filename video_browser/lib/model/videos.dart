import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_api/youtube_api.dart';

class YoutubeVideoList {
  List<YouTubeVideo> videos;

  YoutubeVideoList({required this.videos});
}

class VideoList {
  List<Video> videos;

  VideoList({required this.videos});

  factory VideoList.fromJson(Map<String, dynamic> json) {
    var videosJson = json['hits'] as List;

    List<Video> videos = videosJson.map((i) => Video.fromJson(i)).toList();
    return VideoList(videos: videos);
  }
}

class Video {
  final String url;
  final String picture_id;
  final String tags;
  final String user;
  final String userImage;
  final int views;
  final int likes;
  final int comments;

  Video(
      {required this.url,
      required this.picture_id,
      required this.tags,
      required this.user,
      required this.userImage,
      required this.views,
      required this.likes,
      required this.comments});

  factory Video.fromJson(Map<String, dynamic> json) {
    String urlFromJson = (json['videos']['medium']['url'] as String);
    String videoId = '';
    if (urlFromJson.contains('/external/')) {
      videoId = urlFromJson.split('external/')[1].split('.')[0];
    } else {
      videoId = urlFromJson.split('playback/')[1].split('/')[0];
    }

    return Video(
      url: videoId,
      picture_id: json['picture_id'] as String,
      tags: json['tags'] as String,
      user: json['user'] as String,
      userImage: json['userImageURL'] as String,
      views: json['views'] as int,
      likes: json['likes'] as int,
      comments: json['comments'] as int,
    );
  }
}

Future<List<YouTubeVideo>> searchYoutubeVideoList() async {
  String key = 'AIzaSyAv5QS5rq17_2nGdrMJStN3qKVsvkd4QvQ';
  YoutubeAPI youtube = YoutubeAPI(key, maxResults: 25, type: "video");
  List<YouTubeVideo> videoResult = [];

  String query = "Cats";
  videoResult = await youtube.search(
    query,
    order: 'relevance',
    videoDuration: 'any',
  );
  videoResult = await youtube.nextPage();

  return videoResult;
}

Future<List<YouTubeVideo>> trendsYoutubeVideoList() async {
  String key = 'AIzaSyAv5QS5rq17_2nGdrMJStN3qKVsvkd4QvQ';
  YoutubeAPI youtube = YoutubeAPI(key);
  List<YouTubeVideo> videoResult = [];

  String regionCode = 'DE';
  videoResult = await youtube.getTrends(regionCode: regionCode);
  videoResult = await youtube.nextPage();
  return videoResult;
}

Future<VideoList> getVideoList() async {
  const API_KEY = '27236302-31d450790e5e22d1a48e68e7f';
  const url = "https://pixabay.com/api/videos/?key=" + API_KEY;
  final response = await http.get(
    Uri.parse(url),
  );
  if (response.statusCode == 200) {
    return VideoList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
