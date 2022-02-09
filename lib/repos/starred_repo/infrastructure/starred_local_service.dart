import '../../core/infrastructure/database/database.dart';
import '../../core/infrastructure/pagination_config.dart';
import 'repo_dto.dart';

class StarredLocalService {
  final DataBase _db;
  final PaginationConfig _pageConfig;

  StarredLocalService(this._db, this._pageConfig);

  /// Inserts and Updates local storage.
  Future<void> upsertPage(List<RepoDTO> dtos, int page) async {
    // Preparing data.
    final paginatedKeys = _pageConfig.getPaginatedKeys(dtos, page);
    final records = dtos.map((e) => e.toJson()).toList();

    await _db.saveRecords(paginatedKeys, records);
  }

  /// Gets a page from local storage.
  Future<List<RepoDTO>> getPage(int page) async {
    final databasePage = _pageConfig.getDatabasePage(page);
    final records = await _db.findRecords(
      limit: PaginationConfig.itemsPerPage,
      offset: databasePage * PaginationConfig.itemsPerPage,
    );
    return records.map((e) => RepoDTO.fromJson(e)).toList();
  }

  /// Deletes repo from local storage.
  ///
  /// Updates database.
  Future<void> deleteRepo(int repoIndex) async {
    // get the database page of the repo which we want to delete.
    final databasePage = _pageConfig.getRepoDatabasePage(repoIndex);

    // get all repos which we want to update its keys when we delete the repo.
    // the repo we want to delete is at index 0.
    final records = await _db.findRecords(offset: repoIndex);
    // get the keys.
    final keysToUpdate = _pageConfig.getPaginatedKeys(records, databasePage);

    // deletes all the repos from database.
    await _db.deleteRecords(keysToUpdate);

    // delete the repo from the records list.
    records.removeAt(0);

    // update database.
    await _db.saveRecords(keysToUpdate, records);
  }
}
