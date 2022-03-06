// ignore: depend_on_referenced_packages, implementation_imports
import 'package:collection/src/list_extensions.dart';

import '../../starred_repo/infrastructure/repo_dto.dart';

// ignore: avoid_classes_with_only_static_members
class PaginationConfig {
  const PaginationConfig();

  static const itemsPerPage = 10;

  /// Returns an `int` which will be used as a key in the database.
  int getDatabaseKey(int serverIndex, int serverPage) {
    final databasePage = calculateDatabasePageFromServerPage(serverPage);

    //  sever page 1   ||   sever page 2   ||   sever page 3   ||
    // will be page 0  ||  will be page 1  ||  will be page 2  ||
    //   0 + 3 * 0     ||     0 + 3 * 1    ||     0 + 3 * 2    ||
    //   0, 1, 2       ||     3, 4, 5      ||     6, 7, 8      ||
    return serverIndex + itemsPerPage * databasePage;
  }

  /// Returns database's page.
  int calculateDatabasePageFromServerPage(int serverPage) => serverPage - 1;

  List<RepoDTO> addPaginationToResponse(
    List<dynamic> data,
    int serverPage,
  ) {
    return data.mapIndexed(
      (index, data) {
        data['index'] = getDatabaseKey(index, serverPage);
        return RepoDTO.fromJson(data as Map<String, dynamic>);
      },
    ).toList();
  }

  bool isNextPageAvailable(int repoCount, int page) {
    final nextPage = (repoCount / itemsPerPage).ceil();
    return page < nextPage;
  }

  int getOffset(int serverPage) {
    final databasePage = calculateDatabasePageFromServerPage(serverPage);
    return databasePage * itemsPerPage;
  }
}
