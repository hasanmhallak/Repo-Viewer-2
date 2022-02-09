// ignore: depend_on_referenced_packages, implementation_imports
import 'package:collection/src/list_extensions.dart';

import '../../core/infrastructure/database/database.dart';
import '../../core/infrastructure/pagination_config.dart';
import 'repo_dto.dart';

class StarredLocalService {
  final DataBase _db;

  StarredLocalService(this._db);

  /// Inserts and Updates local storage.
  Future<void> upsertPage(List<RepoDTO> dtos, int page) async {
    // Preparing data.
    final paginatedKeys = _getPaginatedKeys(dtos, page);
    final records = dtos.map((e) => e.toJson()).toList();

    await _db.saveRecords(paginatedKeys, records);
  }

  /// Gets a page from local storage.
  Future<List<RepoDTO>> getPage(int page) async {
    final dataBasePage = page - 1;
    final records = await _db.findRecords(
      limit: PaginationConfig.itemsPerPage,
      offset: dataBasePage * PaginationConfig.itemsPerPage,
    );
    return records.map((e) => RepoDTO.fromJson(e)).toList();
  }
}

List<int> _getPaginatedKeys(List<RepoDTO> dtos, int page) {
  final dataBasePage = page - 1;

  final paginatedKeys = dtos.mapIndexed(
    (int index, _) {
      //    page 1     ||      page 2     ||      page 3    ||
      //   0 + 3 * 0   ||     0 + 3 * 1   ||     0 + 3 * 2  ||
      //   0, 1, 2     ||     3, 4, 5     ||     6, 7, 8    ||
      return index + PaginationConfig.itemsPerPage * dataBasePage;
    },
  ).toList();
  return paginatedKeys;
}
