/// Inicialmente para crear un proyecto hacemos lo siguiente:
/// cmd + shit + P, escribimos <<Flutter new project>> y creamos el proyecto.
/// Borramos el contenido del main y escribimos <<mateapp>> para crear un estructura basica de main

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/app_theme/app_theme.dart';
import 'package:toktik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infrastructure/repositories/vide_post_repository_impl.dart';
import 'package:toktik/presentation/provider/discover_provider.dart';
import 'package:toktik/presentation/screen/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImpl(videosDatasource: LocalVideoDatasource());

    return MultiProvider(
      //Se envuelve el materialApp en un multiProvider
      providers: [
        ChangeNotifierProvider(
            create: (_) => DiscoverProvider(
                videosRepository: videoPostRepository)
              ..loadNextpage()), //Se llama el changeNotifier para crear la instancia de provider
      ],
      child: MaterialApp(
          title: 'TokTik',
          debugShowCheckedModeBanner: false, //Quita el debug del banner
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
