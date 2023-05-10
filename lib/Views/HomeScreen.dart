import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_4_side_navigation_media_fetching/Views/audio.dart';
import 'package:task_4_side_navigation_media_fetching/Views/image.dart';
import 'package:task_4_side_navigation_media_fetching/Views/video.dart';
import 'package:task_4_side_navigation_media_fetching/helper/context_extension.dart';
import 'package:task_4_side_navigation_media_fetching/helper/string_resources.dart';

import '../Bloc/Nvigator/bloc/navigator_bloc.dart';
import '../custom_widgets/drawerwidget.dart';
import '../helper/dimension.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringResources.TITle_Name),
      ),
      body: BlocBuilder<NavigatorBloc, NavigatorStates>(
        builder: (context, state) {
          if (state is LoadingImageNavigatorState) {
            return ImageScreen();
          }
          if (state is LoadingMusicNavigatorState) {
            return MusicPlayer();
          }
          if (state is LoadingVideoNavigatorState) {
            return VideoScreen();
          }
          return Column(
            children: [
              SizedBox(
                height: context.heightC * Dimension.D_0_1,
              ),
              Text(StringResources.TITle_Description),
              Image.asset(
                'assets/video.png',
                height: context.heightC * Dimension.D_0_5,
                width: context.widthC * Dimension.D_0_5,
              )
            ],
          );
        },
      ),
      drawer: DrawerWidget(),
    );
  }
}
