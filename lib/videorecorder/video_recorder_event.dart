part of 'video_recorder_bloc.dart';

@immutable
abstract class VideoRecorderEvent {}

class VideoStartEvent extends VideoRecorderEvent {}

class VideoStopEvent extends VideoRecorderEvent {}

class CameraInitilizeEvent extends VideoRecorderEvent {}
