part of 'image_bloc_bloc.dart';

@immutable
abstract class ImageBlocState {}

class Loading extends ImageBlocState {}

class ImageGetState extends ImageBlocState {
  final String images;

  ImageGetState(this.images);
}
