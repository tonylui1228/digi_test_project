import 'package:digi_test_project/repository/track_history_repository.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../model/track_dto.dart';

class TrackHistoryController extends GetxController {
  var trackDtoList = <TrackDto>[].obs;
  late TrackHistoryRepository trackHistoryRepository;

  @override
  void onInit() async {
    super.onInit();
    trackHistoryRepository = await GetIt.instance.getAsync();
    trackHistoryRepository
        .trackDtoUpdateStream()
        .listen((event) => {reloadTrackDtoList()});
    reloadTrackDtoList();
  }

  void reloadTrackDtoList() async {
    List<TrackDto> localTrackDtoList = trackHistoryRepository.getAllTrack();
    trackDtoList.value.clear();
    trackDtoList.value.addAll(localTrackDtoList);
    trackDtoList.refresh();
  }
}
