part of 'navigator_bloc.dart';

@immutable
abstract class NavigatorStates {}

class NavigatorInitial extends NavigatorStates {}

class LoadingMusicNavigatorState extends NavigatorStates {}

class LoadingVideoNavigatorState extends NavigatorStates {}

class LoadingImageNavigatorState extends NavigatorStates {}
