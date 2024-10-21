import 'dart:convert';

import 'package:digi_test_project/const/server_path.dart';
import 'package:digi_test_project/repository/restful_client_repository.dart';
import 'package:dio/dio.dart';

import '../model/search_result_dto.dart';

class ItunesSearchRepository {
  final RestfulClientRepository restfulClientRepository;

  ItunesSearchRepository(this.restfulClientRepository);

  Future<SearchResultDto> getList({
    required String term,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await restfulClientRepository.dioClient.get(
        serverUrl + itunesSearchPath,
        queryParameters: {'term': term},
        cancelToken: cancelToken,
      );
      return SearchResultDto.fromJson(
          jsonDecode(response.data) as Map<String, dynamic>);
    } catch (error) {
      rethrow;
    }
  }
}
