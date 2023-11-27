import 'package:dio/dio.dart';
import 'package:movie_app/core/strings.dart';
import 'package:movie_app/infrastructure/api_key.dart';

class DioProvider {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: kBaseUrl,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    ),
  );
  static Dio get dio => _dio;
}

/* @module
abstract class DioProvider {
  @singleton
  Dio dio(IConfig config) {
    Dio dio = Dio();
    dio.options.headers = config.headers;
    return dio;
  }
} */
