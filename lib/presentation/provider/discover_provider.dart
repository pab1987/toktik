import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

//Esta es nuetra clase de provider para manejar los estados
class DiscoverProvider extends ChangeNotifier {

  final VideoPostRepository videosRepository;
  
  bool initialLoading = true; //Bandera de carga de aplicación
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videosRepository
  });

  Future<void> loadNextpage() async {
    //await Future.delayed(const Duration(milliseconds: 2000));

    /* final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJsonMap(video).toVideopostEntity())
        .toList(); */
    
    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
