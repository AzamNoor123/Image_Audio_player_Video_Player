import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

part 'video_recorder_event.dart';
part 'video_recorder_state.dart';

class VideoRecorderBloc extends Bloc<VideoRecorderEvent, VideoRecorderState> {
  VideoRecorderBloc() : super(VideoRecorderInitial()) {
    VideoPlayerController videoController;
    ChewieController chewieController;
    CameraController? cameraController;
    on<CameraInitilizeEvent>((event, emit) async {
      final camera = await availableCameras();
      final front = camera.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.back);
      cameraController = CameraController(front, ResolutionPreset.medium);
      await cameraController!.initialize();
      await cameraController!.startVideoRecording();
      emit(CameraInitlizeState(cameraController!));
    });
    on<VideoStartEvent>((event, emit) async {
      XFile file = await cameraController!.stopVideoRecording();
      print(file.path);

      videoController = VideoPlayerController.file(File(file.path));
      videoController.initialize();
      chewieController = ChewieController(
          videoPlayerController: videoController,
          autoPlay: true,
          looping: false);
      emit((RecordingStop(
        videoController,
        chewieController,
      )));
    });
  }
}
