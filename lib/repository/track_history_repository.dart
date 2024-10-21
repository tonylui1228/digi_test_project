import 'dart:async';

import 'package:digi_test_project/model/track_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TrackHistoryRepository {
  static const String _boxName = 'trackBox';

  late Box<TrackDto> _box;

  static Future<TrackHistoryRepository> create() async {
    var trackHistoryRepository = TrackHistoryRepository();
    trackHistoryRepository._box = await Hive.openBox<TrackDto>(_boxName);
    return trackHistoryRepository;
  }

  void addTrack(TrackDto track) {
    track.addToHistoryTime = DateTime.now();
    _box.put(track.trackId, track);
  }

  List<TrackDto> getAllTrack() {
    List<TrackDto> trackDtoList = _box.values.toList();
    trackDtoList.sort((a, b) => (b.addToHistoryTime ?? DateTime.now())
        .compareTo(a.addToHistoryTime ?? DateTime.now()));
    return trackDtoList;
  }

  void deleteTrack(TrackDto trackDto) async {
    _box.delete(trackDto.trackId);
  }

  Stream<BoxEvent> trackDtoUpdateStream() {
    return _box.watch();
  }
}
