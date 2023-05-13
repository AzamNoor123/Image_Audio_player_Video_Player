import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_4_side_navigation_media_fetching/Video/bloc/video_bloc.dart';
import 'package:task_4_side_navigation_media_fetching/Views/HomeScreen.dart';
import 'package:task_4_side_navigation_media_fetching/helper/string_resources.dart';
import 'AudioBloc/music_bloc.dart';
import 'ImageBloc/image_bloc_bloc.dart';
import 'Nvigator/bloc/navigator_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        BlocProvider(create: (context) => VideoBloc()),
        BlocProvider(create: (context) => NavigatorBloc()),
      ],
      child: MaterialApp(
          title: StringResources.TITle_Name,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreens()),
    );
  }
}
