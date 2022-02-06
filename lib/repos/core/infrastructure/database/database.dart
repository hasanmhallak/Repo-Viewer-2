import 'sembast_database.dart';

abstract class DataBase {
  factory DataBase(StoreType type, String name, SembastDatabase db) =
      SembastDbStore;

  /// Save multiple records, creating the one needed.
  ///
  /// The list of [values] must match the list of [keys].
  Future<void> saveRecords(
    List<dynamic> keys,
    List<Map<String, dynamic>> values,
  );

  /// Save a record, create if needed.
  Future<void> saveRecord(
    dynamic key,
    Map<String, dynamic> value,
  );

  /// Get a record value from the database.
  Future<Map<String, dynamic>?> getRecord(dynamic key);

  /// Get all records values.
  Future<List<Map<String, dynamic>>> getRecords(List<dynamic> keys);

  /// Find multiple records.
  ///
  /// Returns an empty array if none found.
  Future<List<Map<String, dynamic>>> findRecords({
    int? offset,
    int? limit,
  });

  /// Deletes the record.
  Future<void> deleteRecord(dynamic key);
}
