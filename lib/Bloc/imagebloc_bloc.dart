import 'dart:async';

import 'package:bloc/bloc.dart';

import 'bloc.dart';

class ImageBlocBloc extends Bloc<ImageBlocEvent, ImageBlocState> {
  @override
  ImageBlocState get initialState => ImageBlocInitial();

  @override
  Stream<ImageBlocState> mapEventToState(
    ImageBlocEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
