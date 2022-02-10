import '../../core/domain/fresh.dart';
import '../../core/domain/repo_failure.dart';
import '../../core/infrastructure/helper_classes/rest_api_exception.dart';
import '../../starred_repo/infrastructure/repo_dto.dart';
import '../infrastructure/starred_local_service.dart';
import '../infrastructure/starred_remote_service.dart';
import 'repo.dart';

class StarredRepository {
  final StarredRemoteService _remoteService;
  final StarredLocalService _localService;

  StarredRepository(this._remoteService, this._localService);

  Future getStarredReposPage(int page) async {
    try {
      final remoteResponse = await _remoteService.getPage(page);
      remoteResponse.when(
        noConnection: () => _noConnection(page),
        notModified: (isNextPageAvailable) => _notModified(
          isNextPageAvailable,
          page,
        ),
        withData: (data, isNextPageAvailable) => Fresh.yes(
          data,
          isNextPageAvailable: isNextPageAvailable,
        ),
      );
    } on RestApiException catch (e) {
      return RepoFailure.api(code: e.errorCode, message: e.message);
    }
  }

  Future<Fresh<List<Repo>>> _noConnection(int page) async {
    final data =
        await _localService.getPage(page).then((dtos) => dtos.toDomain());
    final isNextPageAvailable = await _localService.isNextPageAvailable(page);
    return Fresh.no(data, isNextPageAvailable: isNextPageAvailable);
  }

  Future<Fresh<List<Repo>>> _notModified(
      bool isNextPageAvailable, int page) async {
    final data =
        await _localService.getPage(page).then((dtos) => dtos.toDomain());
    return Fresh.yes(data, isNextPageAvailable: isNextPageAvailable);
  }
}
