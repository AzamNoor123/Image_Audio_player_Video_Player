import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

abstract class VideoState {}

class VideoInitialState extends VideoState {}

class VideoLoadingState extends VideoState {}

class VideoReadyState extends VideoState {
  final VideoPlayerController controller;
  final ChewieController chewieController;

  VideoReadyState(this.controller, this.chewieController);
}

class VideoErrorState extends VideoState {}
