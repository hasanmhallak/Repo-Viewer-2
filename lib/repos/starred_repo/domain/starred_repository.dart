import 'package:repo_viewer/repos/core/infrastructure/helper_classes/rest_api_exception.dart';
import 'package:repo_viewer/repos/starred_repo/infrastructure/starred_local_service.dart';
import 'package:repo_viewer/repos/starred_repo/infrastructure/starred_remote_service.dart';

class StarredRepository {
  final StarredRemoteService _remoteService;
  final StarredLocalService _localService;

  StarredRepository(this._remoteService, this._localService);

  Future getStarredReposPage(int page) async {
    try {
      final remoteResponse = await _remoteService.getPage(page);
      remoteResponse.when(
        noConnection: noConnection,
        notModified: notModified,
        withData: withData,
      );
    } on RestApiException catch (e) {}
  }
}
