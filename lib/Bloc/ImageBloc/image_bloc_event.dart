part of 'image_bloc_bloc.dart';

@immutable
abstract class ImageBlocEvent {}

class ImageFromCamera extends ImageBlocEvent {}

class ImageFromGallery extends ImageBlocEvent {}
