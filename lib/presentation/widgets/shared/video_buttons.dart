import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/humam_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: video.likes,
          iconColor: Colors.red,
          iconData: Icons.favorite,
        ),
        const SizedBox(
          height: 15,
        ),
        _CustomIconButton(
          value: video.views,
          iconData: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(
          height: 15,
        ),
        //Esta es una animación hecha por Fernando Herrera.
        //Para aprender m´ás sobre esta y otras librerías... hacer el curso de flutter intermedio
        //link de la librería: https://pub.dev/packages/animate_do/install
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButton(
            value: 0,
            iconData: Icons.play_circle_outline,
          ),
        )
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton(
      {required this.value, required this.iconData, iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: color,
              size: 30,
            )),
        if (value > 0)
          Text(HumanFormats.humanReadbleNumber(value
              .toDouble())) //De esta forma damos formato al número que mostramos en pantalla para los botones.
      ],
    );
  }
}
