

import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';
//Pantalla del video player
//Instalarlo con el pubspec assist
//Ver la documentación de video player
class FullScreenPlayer extends StatefulWidget {

  //Solo necesitamos estos dos parametros para poder reutilizar el widget luego
  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key, 
    required this.videoUrl, 
    required this.caption
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {

  //Este controlador lo ocupamos para poder ver toda la información de progreso del video
  late VideoPlayerController controller;

  //Configuración para el  ciclo de vida del Statefulwidget
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl) 
    ..setVolume(0)//Pone el volumen en 0
    ..setLooping(true) //Hace que el video llegue al final y se vuelva a reproducir
    ..play(); //Se empiza a reproducir inmediatamente
  }


  //Siempre se debe destruir la reproducción para evitar que el video se siga reproduciendo
  //así no lo estemos viendo. Con esto impedimos la perdida de memoria. 
  @override
  void dispose() {
    controller.dispose();
    super.dispose();//El super siempre debe ir al final
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) { //ESte snapshot es el estado del future anterior. 
      if(snapshot.connectionState != ConnectionState.done) {
        return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
      }
      return GestureDetector(
        onTap: () {
          if(controller.value.isPlaying) {
            controller.pause();
            return;
          }
          
          controller.play();
        },
        child: AspectRatio(//Aspecto del video
          aspectRatio: controller.value.aspectRatio,
          child: Stack(//Este Stack permite poner un widget sobre otro para poder ver el caption sobre el video
            children: [
              VideoPlayer(controller),
        
              VideoBackground(
                stops: const [0.8, 1.0],
              ),
        
        
        
              //Text video caption
              Positioned(
                bottom: 50,
                left: 20,
                child: _VideoCaption(caption: widget.caption,))
            ]
          )
        ),
      );
      },
    );
  }
}


//Esta clase agrega un caption o descrición en la parte inferior del video
class _VideoCaption extends StatelessWidget {
  final String caption;

  const _VideoCaption({
    required this.caption
  });

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size; 
  final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text( caption, maxLines: 2, style: titleStyle),
    );
  }
}