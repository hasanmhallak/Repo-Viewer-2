// ignore: depend_on_referenced_packages, implementation_imports
import 'package:collection/src/list_extensions.dart';

class PaginationConfig {
  static const itemsPerPage = 30;

  List<int> getPaginatedKeys(List<dynamic> list, int page) {
    final databasePage = getDatabasePage(page);

    final paginatedKeys = list.mapIndexed(
      (int index, _) {
        //     page 1      ||      page 2      ||      page 3      ||
        // will be page 0  ||  will be page 1  ||  will be page 2  ||
        //   0 + 3 * 0     ||     0 + 3 * 1    ||     0 + 3 * 2    ||
        //   0, 1, 2       ||     3, 4, 5      ||     6, 7, 8      ||
        return index + PaginationConfig.itemsPerPage * databasePage;
      },
    ).toList();
    return paginatedKeys;
  }

  /// Returns database's page.
  int getDatabasePage(int page) => page - 1;

  /// Returns the databse's page in which the repo is in.
  int getRepoDatabasePage(int repoIndex) {
    return (repoIndex / PaginationConfig.itemsPerPage).floor();
  }
}
