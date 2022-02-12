import 'package:dartz/dartz.dart';

import '../../../core/infrastructure/api/api.dart';
import '../../core/domain/fresh.dart';
import '../../core/domain/repo_failure.dart';
import '../../core/infrastructure/dto/header_dto.dart';
import '../../core/infrastructure/headers_local_service.dart';
import '../../core/infrastructure/helper_classes/rest_api_exception.dart';
import '../infrastructure/repo_dto.dart';
import '../infrastructure/starred_local_service.dart';
import '../infrastructure/starred_remote_service.dart';
import 'repo.dart';

class StarredRepository {
  final StarredRemoteService _remoteService;
  final StarredLocalService _localService;
  final HeadersLocalService _headersLocalService;
  final GitlabApi _apiStore;

  StarredRepository({
    required StarredRemoteService remoteService,
    required StarredLocalService localService,
    required HeadersLocalService headersLocalService,
    required GitlabApi apiStore,
  })  : _remoteService = remoteService,
        _localService = localService,
        _headersLocalService = headersLocalService,
        _apiStore = apiStore;

  Future<Either<RepoFailure, Fresh<List<Repo>>>> getStarredReposPage(
    int page,
  ) async {
    final requestUrl = _getStarredReposUrl(page);

    final previousHeader = await _getPreviousHeaders(requestUrl);

    try {
      final remoteResponse =
          await _remoteService.getPage(page, previousHeader, requestUrl);

      return right(
        await remoteResponse.when(
          noConnection: () => _noConnection(page),
          notModified: (headers, isNextPageAvailable) => _notModified(
            headers,
            isNextPageAvailable,
            page,
          ),
          withData: (data, headers, isNextPageAvailable) => _withData(
            data,
            headers,
            isNextPageAvailable,
          ),
        ),
      );
    } on RestApiException catch (e) {
      return left(RepoFailure.api(code: e.errorCode, message: e.message));
    }
  }

  Future<Fresh<List<Repo>>> _noConnection(int page) async {
    // getting old data from local service.
    final data =
        await _localService.getPage(page).then((dtos) => dtos.toDomain());

    final isNextPageAvailable = await _localService.isNextPageAvailable(page);

    return Fresh.no(
      data,
      isNextPageAvailable: isNextPageAvailable,
    );
  }

  Future<Fresh<List<Repo>>> _notModified(
    HeaderDTO headers,
    bool isNextPageAvailable,
    int page,
  ) async {
    // saving headers.
    await _headersLocalService.saveHeaders(headers);
    // getting fresh data from local service.
    final data =
        await _localService.getPage(page).then((dtos) => dtos.toDomain());

    return Fresh.yes(
      data,
      isNextPageAvailable: isNextPageAvailable,
    );
  }

  Future<Fresh<List<Repo>>> _withData(
    List<RepoDTO> data,
    HeaderDTO headers,
    bool isNextPageAvailable,
  ) async {
    // saving headers.
    await _headersLocalService.saveHeaders(headers);
    // updating local service.
    await _localService.upsertPage(data);

    return Fresh.yes(
      data.toDomain(),
      isNextPageAvailable: isNextPageAvailable,
    );
  }

  Uri _getStarredReposUrl(int page) {
    return _apiStore.starredReposUri(page);
  }

  Future<HeaderDTO?> _getPreviousHeaders(Uri requestUrl) async {
    return _headersLocalService.getHeaders(requestUrl.toString());
  }
}
