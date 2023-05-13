import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_4_side_navigation_media_fetching/Video/bloc/video_event.dart';
import 'package:task_4_side_navigation_media_fetching/helper/dimension.dart';
import 'package:task_4_side_navigation_media_fetching/helper/string_resources.dart';
import 'package:task_4_side_navigation_media_fetching/helper/Extension_Pkg/widget_extension.dart';
import 'package:video_player/video_player.dart';

import '../Video/bloc/video_bloc.dart';
import '../Video/bloc/video_state.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController? controller;
  ChewieController? chewieController;

  @override
  void dispose() {
    controller?.dispose();
    chewieController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * Dimension.D_0_2,
      ),
      SafeArea(
          child: BlocBuilder<VideoBloc, VideoState>(builder: (context, state) {
        if (state is VideoLoadingState) {
          return Text(StringResources.NO_VIDEO_SELECTED);
        } else if (state is VideoReadyState) {
          controller = state.controller;
          chewieController = state.chewieController;
          if (controller != null && chewieController != null) {
            return AspectRatio(
              aspectRatio: controller?.value.aspectRatio ?? 16 / 19,
              child: Chewie(
                controller: chewieController!,
              ),
            );
          }
        }
        return Text(StringResources.NO_VIDEO_SELECTED);
      })),
      ElevatedButton(
              onPressed: () {
                BlocProvider.of<VideoBloc>(context).add(UploadVideoEvent());
              },
              child: Text(StringResources.LOAD_VIDEOS))
          .centerwidget,
    ]).centerwidget);
  }
}
