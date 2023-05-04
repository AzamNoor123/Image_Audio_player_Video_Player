part of 'music_bloc.dart';

@immutable
abstract class MusicEvent {}

class LoadEvent extends MusicEvent {}

class PausedEvent extends MusicEvent {}

class PlayEvent extends MusicEvent {}

class ResumeEvent extends MusicEvent {}

class FastForwardEvent extends MusicEvent {}

class FastReversedEvent extends MusicEvent {}

class SeekPositionChanged extends MusicEvent {
  final Duration seekPosition;

  SeekPositionChanged(this.seekPosition);

  @override
  List<Object> get props => [seekPosition];
}

class ApplySeekPosition extends MusicEvent {
  final Duration seekPosition;

  ApplySeekPosition(this.seekPosition);

  @override
  List<Object> get props => [seekPosition];
}
