import '../../core/infrastructure/database/database.dart';
import '../../core/infrastructure/pagination_config.dart';
import 'repo_dto.dart';

class StarredLocalService {
  final DataBase _db;
  final PaginationConfig _config;
  StarredLocalService(this._db, this._config);

  /// Inserts and Updates local storage.
  Future<void> upsertPage(List<RepoDTO> dtos) async {
    // Preparing data.
    final databaseKeys = <int>[];
    final records = dtos.map((dto) {
      databaseKeys.add(dto.index);
      return dto.toJson();
    }).toList();

    await _db.saveRecords(databaseKeys, records);
  }

  /// Gets a page from local storage.
  Future<List<RepoDTO>> getPage(int serverPage) async {
    final records = await _db.findRecords(
      limit: _config.itemsPerPage,
      offset: _config.getOffset(serverPage),
    );
    return records.map((e) => RepoDTO.fromJson(e)).toList();
  }

  /// Checks if next page is available.
  Future<bool> isNextPageAvailable(int page) async {
    final repoCount = await _db.countRecords();
    return _config.isNextPageAvailable(repoCount, page);
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

    final lastItemKeyToDelete = keysToUpdate.last;

    // delete the repo from the records list.
    // TODO: you can use Sets to improve time complexity.
    records.removeAt(0);

    // update database.
    await _db.saveRecords(keysToUpdate, records);

    // remove the last item.
    await _db.deleteRecord(lastItemKeyToDelete);
  }
}
