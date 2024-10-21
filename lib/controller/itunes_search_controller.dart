import 'package:digi_test_project/repository/itunes_search_repository.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../model/track_dto.dart';
import '../util/exception_util.dart';

class ItunesSearchController extends GetxController {
  var isLoading = false.obs;
  var trackDtoList = <TrackDto>[];

  void doItunesSearch(String term, Function(Exception) errorCallback) async {
    try {
      isLoading(true);
      ItunesSearchRepository repository =
          GetIt.instance.get<ItunesSearchRepository>();
      final response = await repository.getList(term: term);
      trackDtoList = response.results.toList();
    } catch (e) {
      trackDtoList.clear();
      errorCallback(ExceptionUtil.handleException(e));
    } finally {
      isLoading(false);
    }
  }
}
