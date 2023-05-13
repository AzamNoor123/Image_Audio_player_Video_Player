part of 'music_bloc.dart';

@immutable
abstract class MusicState {}

class Musicloading extends MusicState {}

class MusicLoaded extends MusicState {}

class Musicpaused extends MusicState {}

class Musicplayed extends MusicState {
  Duration duration;
  Duration position;
  Musicplayed(this.duration, this.position);
}

class Musicerror extends MusicState {
  final String error;

  Musicerror(this.error);
}
