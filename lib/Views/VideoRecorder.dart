import 'package:camera/camera.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_4_side_navigation_media_fetching/helper/Extension_Pkg/widget_extension.dart';
import 'package:task_4_side_navigation_media_fetching/helper/constat_resources.dart';
import 'package:task_4_side_navigation_media_fetching/helper/string_resources.dart';
import 'package:video_player/video_player.dart';

import '../videorecorder/video_recorder_bloc.dart';

class VideoRecorder extends StatefulWidget {
  const VideoRecorder({super.key});

  @override
  State<VideoRecorder> createState() => _VideoRecorderState();
}

class _VideoRecorderState extends State<VideoRecorder> {
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
      appBar: AppBar(title: Text('Video Recorder')),
      body: BlocBuilder<VideoRecorderBloc, VideoRecorderState>(
        builder: (context, state) {
          if (state is CameraInitlizeState) {
            return Stack(
              children: [
                CameraPreview(state.controller),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: FloatingActionButton(
                        backgroundColor: Colors.blue,
                        child: Text(StringResources.STOP_BTN),
                        onPressed: () {
                          BlocProvider.of<VideoRecorderBloc>(context)
                              .add(VideoStartEvent());
                        }))
              ],
            );
          } else if (state is RecordingStop) {
            controller = state.controller;
            chewieController = state.chewieController;
            if (controller != null && chewieController != null) {
              return AspectRatio(
                aspectRatio:
                    controller?.value.aspectRatio ?? ConstResource.ASPECT_Ratio,
                child: Chewie(
                  controller: chewieController!,
                ),
              );
            }
          }
          return CircularProgressIndicator().centerwidget;
        },
      ),
    );
  }
}
