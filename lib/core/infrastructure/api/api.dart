import '../../../repos/core/infrastructure/pagination_config.dart';

class GitlabApi {
  final PaginationConfig _config;
  GitlabApi(this._config);

  Uri starredReposUri(int page) {
    return Uri.https(
      'gitlab.com/api/v4',
      '/users/user_name/starred_projects',
      {
        'page': page,
        'per_page': _config.itemsPerPage,
        'simple': true,
      },
    );
  }
}
