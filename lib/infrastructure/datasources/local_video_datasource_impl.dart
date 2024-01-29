import 'package:toktik/domain/datasources/video_pots_data_source.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class LocalVideoDatasource implements VideoPostDataSource {
  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJsonMap(video).toVideopostEntity())
        .toList();

    return newVideos;
  }

  @override
  Future<List<VideoPost>> getfavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }
}
