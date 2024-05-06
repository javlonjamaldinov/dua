import 'package:bloc/bloc.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioCubit extends Cubit<PlayerState> {
  final AudioPlayer _player;

  AudioCubit() : _player = AudioPlayer(), super(PlayerState.stopped) {
    _player.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
        pause();
      } else {
        emit(state);
      }
    });
  }

  void play(AssetSource source) async {
    await _player.play(source);
  }

  void pause() {
    _player.pause();
    emit(PlayerState.paused);
  }

  @override
  Future<void> close() {
    _player.dispose();
    return super.close();
  }

  void toggleBookmark() {}
}
