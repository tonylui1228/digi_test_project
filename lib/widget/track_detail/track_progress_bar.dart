import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';

class TrackProgressBar extends StatefulWidget {
  TrackProgressBar({super.key, required this.player});

  AudioPlayer player;

  @override
  State<TrackProgressBar> createState() => TrackProgressBarState();
}

class TrackProgressBarState extends State<TrackProgressBar> {
  TrackProgressBarState();

  @override
  Widget build(BuildContext context) {
    return _progressBar();
  }

  Stream<DurationState> _durationStream() {
    return Stream<DurationState>.periodic(const Duration(milliseconds: 100),
        (x) {
      return DurationState(
          progress: widget.player.position,
          buffered: widget.player.bufferedPosition,
          total: widget.player.duration ?? Duration.zero);
    });
  }

  StreamBuilder<DurationState> _progressBar() {
    return StreamBuilder<DurationState>(
      stream: _durationStream(),
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progress: progress,
          buffered: buffered,
          total: total,
          onSeek: widget.player.seek,
          onDragUpdate: (details) {
            debugPrint('${details.timeStamp}, ${details.localPosition}');
          },
        );
      },
    );
  }
}

class DurationState {
  const DurationState(
      {required this.progress, required this.buffered, required this.total});

  final Duration progress;
  final Duration buffered;
  final Duration total;
}
