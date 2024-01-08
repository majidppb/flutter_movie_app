import 'package:dio/dio.dart';

import '../../core/strings.dart';
import 'api_key.dart';

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
