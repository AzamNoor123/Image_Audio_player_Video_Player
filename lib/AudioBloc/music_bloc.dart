import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';
import 'package:task_4_side_navigation_media_fetching/helper/constat_resources.dart';

part 'music_event.dart';

part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final player = AudioPlayer();
  bool isplaying = false;
  Duration? duration = Duration.zero;
  Duration position = Duration.zero;

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
          await player.seek(position);
          final ss = player.getDuration();
          emit(Musicplayed(duration!, position));
        } else {
          emit(Musicerror(ConstResource.NO_AUDIO_SELECTED));
        }
      } catch (e) {
        emit(Musicerror(ConstResource.ERROR_MSG));
      }
    });
    on<PausedEvent>((event, emit) async {
      await player.pause();
      emit(Musicpaused());
    });
    on<ResumeEvent>((event, emit) async {
      await player.resume();
      emit(Musicplayed(duration!, position));
    });
    on<FastForwardEvent>((event, emit) {});
    on<SeekPositionChanged>((event, emit) {});
    player.dispose();
  }
}
