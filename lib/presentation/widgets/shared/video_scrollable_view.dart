import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

//En esta clase manejamos el scroll para poder ser usado en cualquier parte del proyecto
class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    //Agremaos las paginas del scroll vertical
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length, //Recibimos el listado de videos
      itemBuilder: (context, index) {
        //builder recibe un itemBuilder
        final VideoPost videoPost = videos[index];
        return Stack(
          children: [
            //Con esto le asignamos el tamaño al video player
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: videoPost.caption,
                videoUrl: videoPost.videoUrl,
              ), //Mandamos los parametros necesarios
            ),
            //Se envuelve nuestro widget con el Positioned para poner moder nuestro botón donde queramos
            Positioned(
                bottom: 40,
                right: 20,
                child: VideoButtons(
                  video: videoPost,
                ))
          ],
        );
      },
    );
  }
}
