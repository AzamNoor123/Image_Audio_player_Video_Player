import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:chewie/chewie.dart';
import 'package:file_picker/file_picker.dart';
import 'package:task_4_side_navigation_media_fetching/Bloc/Video/bloc/video_event.dart';
import 'package:task_4_side_navigation_media_fetching/Bloc/Video/bloc/video_state.dart';
import 'package:video_player/video_player.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super((VideoInitialState())) {
    VideoPlayerController videoController;
    ChewieController chewieController;
    File? videoFile;
    CameraController cameraController;
    on<UploadVideoEvent>((event, emit) async {
      emit(VideoLoadingState());
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.video, allowMultiple: false);
      if (result != null) {
        videoFile = File(result.files.single.path ?? '');
      }
      videoController = VideoPlayerController.file(videoFile!);
      videoController.initialize();
      chewieController = ChewieController(
          videoPlayerController: videoController,
          autoPlay: true,
          looping: false);
      emit(VideoReadyState(
        videoController,
        chewieController,
      ));
    });
  }
}
