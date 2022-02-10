import '../../core/infrastructure/database/database.dart';
import '../../core/infrastructure/pagination_config.dart';
import 'repo_dto.dart';

class StarredLocalService {
  // TODO: move all pagination logic to PaginationService class.
  final DataBase _db;

  StarredLocalService(this._db);

  /// Inserts and Updates local storage.
  Future<void> upsertPage(List<RepoDTO> dtos) async {
    // Preparing data.
    final databaseKeys = dtos.map((dto) => dto.index).toList();
    final records = dtos.map((e) => e.toJson()).toList();

    await _db.saveRecords(databaseKeys, records);
  }

  /// Gets a page from local storage.
  Future<List<RepoDTO>> getPage(int page) async {
    final databasePage =
        PaginationConfig.calculateDatabasePageFromServerPage(page);
    final records = await _db.findRecords(
      limit: PaginationConfig.itemsPerPage,
      offset: databasePage * PaginationConfig.itemsPerPage,
    );
    return records.map((e) => RepoDTO.fromJson(e)).toList();
  }

  /// Checks if next page is available.
  Future<bool> isNextPageAvailable(int page) async {
    final repoCount = await _db.countRecords();
    return PaginationConfig.isNextPageAvailable(repoCount, page);
  }

  /// Deletes repo from local storage.
  ///
  /// Updates database.
  Future<void> deleteRepo(RepoDTO dto) async {
    final databaseIndex = dto.index;

    // get all repos which we want to update its keys when we delete the repo.
    // the repo we want to delete is at index 0.
    final records = await _db.findRecords(offset: databaseIndex);
    // get the keys.
    final keysToUpdate = records.map((e) => RepoDTO.fromJson(e).index).toList();
    // deletes all the repos from database.
    await _db.deleteRecords(keysToUpdate);

    // delete the repo from the records list.
    records.removeAt(0);

    // update database.
    await _db.saveRecords(keysToUpdate, records);
  }
}
