import 'package:toktik/domain/datasources/video_pots_data_source.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {

    final VideoPostDataSource videosDatasource;

  VideoPostsRepositoryImpl({
    required this.videosDatasource
  });

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
     
    return videosDatasource.getTrendingVideosByPage(page);
  }

  @override
  Future<List<VideoPost>> getfavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

}