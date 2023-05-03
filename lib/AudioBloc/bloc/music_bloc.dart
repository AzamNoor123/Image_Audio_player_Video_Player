import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';
import 'package:task_4_side_navigation_media_fetching/helper/constat_resources.dart';

part 'music_event.dart';

part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final player = AudioPlayer();
  Duration? duration;

  MusicBloc() : super(Musicloading()) {
    on<LoadEvent>((event, emit) async {
      try {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.audio,
          allowMultiple: false,
        );

        if (result != null && result.files.isNotEmpty) {
          String path = result.files.single.path!;
          await player.play(DeviceFileSource(path));
          duration = await player.getDuration();
          emit(MusicPlayed());
        } else {
          emit(Musicerror(ConstResource.NO_AUDIO_SELECTED));
        }
      } catch (e) {
        print(e);
        emit(Musicerror(ConstResource.ERROR_MSG));
      }
    });
    on<PausedEvent>((event, emit) async {
      await player.pause();
      emit(Musicpaused());
    });
    on<ResumeEvent>((event, emit) async {
      await player.resume();
      emit(MusicPlayed());
    });
    on<FastForwardEvent>((event, emit) {});
    on<PlayEvent>((event, emit) {});
  }
}
