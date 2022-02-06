import 'package:repo_viewer/repos/core/infrastructure/database/database.dart';
import 'package:repo_viewer/repos/core/infrastructure/header_dto.dart';

class HeadersLocalService {
  final DataBase _db;

  HeadersLocalService(this._db);

  /// Save headers to local storage.
  Future<void> saveHeaders(HeaderDTO dto) async {
    await _db.saveRecord(dto.url, dto.toJson());
  }

  /// Get headers from local storage.
  Future<HeaderDTO?> getHeaders(String key) async {
    final json = await _db.getRecord(key);
    return json == null ? null : HeaderDTO.fromJson(json);
  }

  /// Deletes headers from local storage.
  Future<void> deletHeader(HeaderDTO dto) async {
    await _db.deleteRecord(dto.url);
  }
}
