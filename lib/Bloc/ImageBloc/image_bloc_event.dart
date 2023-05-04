part of 'image_bloc_bloc.dart';

@immutable
abstract class ImageBlocEvent {}

class ImageFromCamera extends ImageBlocEvent {}

class ImageFromGallery extends ImageBlocEvent {}

class loadingMusicEvent extends ImageBlocEvent {}

class loadingVideoEvent extends ImageBlocEvent {}
