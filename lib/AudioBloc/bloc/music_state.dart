part of 'music_bloc.dart';

@immutable
abstract class MusicState {}

class Musicloading extends MusicState {}

class MusicLoaded extends MusicState {}

class MusicPlayed extends MusicState {}

class Musicpaused extends MusicState {}

class Musicseek extends MusicState {
  Duration? duration;
}

class Musicerror extends MusicState {
  final String error;

  Musicerror(this.error);
}
