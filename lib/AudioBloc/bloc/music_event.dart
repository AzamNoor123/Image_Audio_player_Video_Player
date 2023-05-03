part of 'music_bloc.dart';

@immutable
abstract class MusicEvent {}

class LoadEvent extends MusicEvent {}

class PausedEvent extends MusicEvent {}

class PlayEvent extends MusicEvent {}

class ResumeEvent extends MusicEvent {}

class FastForwardEvent extends MusicEvent {}

class FastReversedEvent extends MusicEvent {}
