import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigator_event.dart';
part 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, NavigatorStates> {
  NavigatorBloc() : super(NavigatorInitial()) {
    on<loadingImageNavigatorEvent>((event, emit) {
      emit(LoadingImageNavigatorState());
    });
    on<loadingMusicNavigatorEvent>((event, emit) {
      emit(LoadingMusicNavigatorState());
    });
    on<loadingVideoNavigatorEvent>((event, emit) {
      emit(LoadingVideoNavigatorState());
    });
  }
}
