import 'package:digi_test_project/model/track_dto.dart';
import 'package:digi_test_project/repository/track_history_repository.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';

class TrackDetailController extends GetxController {
  AudioPlayer player = AudioPlayer();

  var isPlaying = false.obs;

  TrackDto trackDto;

  TrackDetailController(this.trackDto);

  @override
  Future onInit() async {
    super.onInit();

    if (isPreviewAble()) {
      player.setUrl(trackDto.previewUrl!);

      player.playerStateStream.listen((playerState) {
        if (playerState.processingState == ProcessingState.completed) {
          isPlaying(false);
        }
        isPlaying(playerState.playing);
      });
    }
  }

  bool isPreviewAble() {
    return trackDto.previewUrl != null;
  }

  @override
  void onClose() {
    super.onClose();
    player.stop();
  }

  void play() async {
    await player.play();
    GetIt.instance.get<TrackHistoryRepository>().addTrack(trackDto);
  }

  void pause() {
    player.pause();
  }

  void skipPrevious() {
    Duration newDuration = player.position - const Duration(seconds: 10);
    if (newDuration <= Duration.zero) {
      newDuration = Duration.zero;
    }
    player.seek(newDuration);
  }

  void skipNext() {
    Duration newDuration = player.position + const Duration(seconds: 10);
    if (newDuration >= (player.duration ?? Duration.zero)) {
      newDuration = player.duration ?? Duration.zero;
    }
    player.seek(newDuration);
  }
}
