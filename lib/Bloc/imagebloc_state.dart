import 'package:equatable/equatable.dart';

abstract class ImageBlocState extends Equatable {
  const ImageBlocState();
}

class ImageBlocInitial extends ImageBlocState {
  @override
  List<Object> get props => [];
}
