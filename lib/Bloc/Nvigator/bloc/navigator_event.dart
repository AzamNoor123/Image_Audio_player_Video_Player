part of 'navigator_bloc.dart';

@immutable
abstract class NavigatorEvent {}

class loadingMusicNavigatorEvent extends NavigatorEvent {}

class loadingVideoNavigatorEvent extends NavigatorEvent {}

class loadingImageNavigatorEvent extends NavigatorEvent {}
