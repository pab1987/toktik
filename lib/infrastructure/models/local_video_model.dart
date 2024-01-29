import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  //Constructor de la clase
  LocalVideoModel(
    { required this.name,
      required this.videoUrl,
      required this.likes,
      required this.views
    }
  );

  //Constructor con nombre para realizar el mapeo del objeto cuando se realice la instancia de la clase
  factory LocalVideoModel.fromJsonMap(Map<String, dynamic> json) =>
      LocalVideoModel(
        name: json['name'],
        videoUrl: json['videoUrl'],
        likes: json['likes'] ?? 0,
        views: json['views'] ?? 0,
      );

  VideoPost toVideopostEntity() =>
      VideoPost(caption: name, videoUrl: videoUrl, likes: likes, views: views);
}