import 'package:dio/dio.dart';
import 'package:repo_viewer/core/infrastructure/extinstions/dio_no_internet.dart';
import 'package:repo_viewer/repos/core/infrastructure/dto/header_dto.dart';
import 'package:repo_viewer/repos/core/infrastructure/helper_classes/remote_response.dart';
import 'package:repo_viewer/repos/core/infrastructure/helper_classes/rest_api_exception.dart';
import 'package:repo_viewer/repos/starred_repo/infrastructure/repo_dto.dart';

import '../../core/infrastructure/headers_local_service.dart';

class StarredRemoteService {
  final Dio _dio;
  final HeadersLocalService _localService;
  StarredRemoteService(
    this._dio,
    this._localService,
  );

  Future<RemoteResponse<List<RepoDTO>>> getPage(int page) async {
    // TODO: this is a business logic related. move it to domain.
    final requestUrl =
        Uri.https('gitlab.com/api/v4', '/users/user_name/starred_projects', {
      'page': page.toString(),
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

      final headersDTO = HeaderDTO.parse(
        requestUrl.toString(),
        response.headers.map,
      );
      await _localService.saveHeaders(headersDTO);

      // success.
      if (response.statusCode == 200) {
        final convertedData = (response.data as List<Map<String, dynamic>>)
            .map(
              (e) => RepoDTO.fromJson(e),
            )
            .toList();
        return RemoteResponse.withData(
          data: convertedData,
          isNextPageAvailable: headersDTO.nextPage > page,
        );

        // Not Modified.
      } else if (response.statusCode == 304) {
        return RemoteResponse.notModified(
          isNextPageAvailable: headersDTO.nextPage > page,
        );
      } else {
        throw RestApiException(
          errorCode: response.statusCode,
          message: response.statusMessage,
        );
      }
    } on DioError catch (e) {
      if (e.isNoConnection) {
        return const RemoteResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(
          errorCode: e.response!.statusCode,
          message: e.response!.statusMessage,
        );
      } else {
        // Unknown error.
        rethrow;
      }
    }
  }
}
