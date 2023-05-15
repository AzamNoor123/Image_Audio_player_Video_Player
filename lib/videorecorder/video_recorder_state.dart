part of 'video_recorder_bloc.dart';

@immutable
abstract class VideoRecorderState {}

class VideoRecorderInitial extends VideoRecorderState {}

class RecordingStart extends VideoRecorderState {}

class RecordingStop extends VideoRecorderState {
  final VideoPlayerController controller;
  final ChewieController chewieController;

  RecordingStop(this.controller, this.chewieController);
}

class CameraInitlizeState extends VideoRecorderState {
  final CameraController controller;
  CameraInitlizeState(this.controller);
}
