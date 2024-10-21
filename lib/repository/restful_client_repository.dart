import 'package:dio/dio.dart';

class RestfulClientRepository {
  final Dio dioClient;

  RestfulClientRepository._(this.dioClient);

  static RestfulClientRepository init() {
    final dio = Dio();
    final restfulApiClient = RestfulClientRepository._(dio);
    return restfulApiClient;
  }
}
