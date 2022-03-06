import './database_impl.dart';
import 'sembast_database.dart';

abstract class DataBase {
  /// Returns [DataBase] instance which stores data with key as `int` and value as Map.
  factory DataBase.integerStore(SembastDatabase db, String name) =
      SembastDbStore.integerStore;

  /// Returns [DataBase] instance which stores data with key as `String` and value as Map.
  factory DataBase.stringStore(SembastDatabase db, String name) =
      SembastDbStore.stringStore;

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

  /// Deletes the records.
  Future<void> deleteRecords(List<dynamic> keys);

  /// Deletes the record.
  Future<void> deleteRecord(dynamic key);

  /// count records.
  Future<int> countRecords();
}
