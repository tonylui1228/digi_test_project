import 'package:digi_test_project/exception/generic_exception.dart';
import 'package:dio/dio.dart';

import '../exception/network_exception.dart';

class ExceptionUtil {
  static Exception handleException(Object error) {
    if (error is DioException) {
      return NetworkException();
    } else {
      return GenericException();
    }
  }
}
