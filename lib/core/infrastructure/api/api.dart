import '../../../repos/core/infrastructure/pagination_config.dart';

class GitlabApi {
  const GitlabApi();

  Uri starredReposUri(int page) {
    return Uri.https(
      'gitlab.com',
      '/api/v4/users/user_name/starred_projects',
      {
        'page': page.toString(),
        'per_page': PaginationConfig.itemsPerPage.toString(),
        'simple': true.toString(),
      },
    );
  }
}
