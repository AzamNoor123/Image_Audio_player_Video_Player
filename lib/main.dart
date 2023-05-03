import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_4_side_navigation_media_fetching/Bloc/Video/bloc/video_bloc.dart';
import 'package:task_4_side_navigation_media_fetching/Views/home.dart';
import 'package:task_4_side_navigation_media_fetching/helper/string_resources.dart';

import 'AudioBloc/bloc/music_bloc.dart';
import 'Bloc/ImageBloc/image_bloc_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImageBlocBloc(),
        ),
        BlocProvider(
          create: (context) => MusicBloc(),
        ),
        BlocProvider(create: (context) => VideoBloc())
      ],
      child: MaterialApp(
          title: StringResources.TITle_Name,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen()),
    );
  }
}
