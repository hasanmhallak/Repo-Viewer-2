import 'package:dio/dio.dart';

import '../../core/infrastructure/headers_local_service.dart';

class StarredRemoteService {
  final Dio _dio;
  final HeadersLocalService _localService;
  StarredRemoteService(
    this._dio,
    this._localService,
  );

  Future getPage(int page) async {
    // TODO: this is a business logic related. move it to domain.
    final requestUrl =
        Uri.https('gitlab.com/api/v4', '/users/user_name/starred_projects', {
      'page': page.toString(),
      // TODO: implements per_page constant.
      'per_page': 30,
      'simple': true,
    });

    final previousHeader =
        await _localService.getHeaders(requestUrl.toString());
    try {
      final response = await _dio.getUri(
        requestUrl,
        options: Options(
          headers: {
            'If-None-Match': previousHeader?.etag ?? '',
          },
        ),
      );

      if (response.statusCode == 200) {
        // success.
      } else if (response.statusCode == 304) {
        // Not Modified.
      }
    } catch (e) {
      print('asd');
    }
  }
}
