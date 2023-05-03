import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_bloc_event.dart';

part 'image_bloc_state.dart';

class ImageBlocBloc extends Bloc<ImageBlocEvent, ImageBlocState> {
  ImageBlocBloc() : super(Loading()) {
    on<ImageFromGallery>((event, emit) async {
      XFile? galleryimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (galleryimage != null) {
        emit(ImageGetState(galleryimage.path));
      }
    });
    on<ImageFromCamera>((event, emit) async {
      XFile? Cameraimage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (Cameraimage != null) {
        emit(ImageGetState(Cameraimage.path));
      }
    });
  }
}
