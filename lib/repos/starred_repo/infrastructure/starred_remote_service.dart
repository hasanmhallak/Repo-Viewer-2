import 'package:dio/dio.dart';

import '../../../core/infrastructure/extinstions/dio_no_internet.dart';
import '../../core/infrastructure/dto/header_dto.dart';
import '../../core/infrastructure/headers_local_service.dart';
import '../../core/infrastructure/helper_classes/remote_response.dart';
import '../../core/infrastructure/helper_classes/rest_api_exception.dart';
import '../../core/infrastructure/pagination_config.dart';
import 'repo_dto.dart';

class StarredRemoteService {
  final Dio _dio;
  final PaginationConfig _config;

  StarredRemoteService(
    this._dio,
    this._config,
  );

  /// Performs [GET] request to get a page.
  ///
  /// Comunicates with [HeadersLocalService] to get and save [Headers].
  ///
  /// Returns:
  ///   - [RemoteResponse.noConnection] if there's no internet connection.
  ///   - [RemoteResponse.notModified] if the page information is not modified.
  ///   - [RemoteResponse.withData] if the request was successful.
  ///
  /// May throw [RestApiException].
  Future<RemoteResponse<List<RepoDTO>>> getPage(
    int page,
    HeaderDTO? previousHeader,
    Uri requestUrl,
  ) async {
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

      switch (response.statusCode) {
        case 200:
          return _ifSuccess(response.data, page, headersDTO);
        case 304:
          return _ifNotModified(headersDTO, page);
        default:
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

  RemoteResponse<List<RepoDTO>> _ifSuccess(
    dynamic data,
    int page,
    HeaderDTO headersDTO,
  ) {
    data as List<Map<String, dynamic>>;
    final convertedData = _config.addPaginationToResponse(data, page);
    return RemoteResponse.withData(
      headers: headersDTO,
      data: convertedData,
      isNextPageAvailable: headersDTO.nextPage > page,
    );
  }

  RemoteResponse<List<RepoDTO>> _ifNotModified(HeaderDTO headersDTO, int page) {
    return RemoteResponse.notModified(
      headers: headersDTO,
      isNextPageAvailable: headersDTO.nextPage > page,
    );
  }
}
