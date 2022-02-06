import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import 'database.dart';

enum StoreType { intMap, stringMap }

class SembastDatabase {
  late Database _instance;
  bool _hasBeenInitialized = false;

  /// initialize database.
  Future<void> init() async {
    if (_hasBeenInitialized) {
      return;
    } else {
      final directory = await getApplicationDocumentsDirectory();
      final dbPath = join(directory.path, 'db.sembast');
      _instance = await databaseFactoryIo.openDatabase(dbPath);
      _hasBeenInitialized = true;
    }
  }

  /// Closes database.
  Future<void> closeDb() {
    return _instance.close();
  }
}

class SembastDbStore implements DataBase {
  final SembastDatabase _db;
  late StoreRef _store;
  SembastDbStore(StoreType type, String name, this._db) {
    switch (type) {
      case StoreType.intMap:
        _store = intMapStoreFactory.store(name);
        break;
      case StoreType.stringMap:
        _store = stringMapStoreFactory.store(name);
    }
  }

  @override
  Future<void> saveRecords(
    List<dynamic> keys,
    List<Map<String, dynamic>> values,
  ) async {
    await _store.records(keys).put(_db._instance, values);
  }

  @override
  Future<void> saveRecord(
    dynamic key,
    Map<String, dynamic> value,
  ) async {
    await _store.record(key).put(_db._instance, value);
  }

  @override
  Future<Map<String, dynamic>?> getRecord(dynamic key) async {
    return await _store.record(key).get(_db._instance) as Map<String, dynamic>?;
  }

  @override
  Future<List<Map<String, dynamic>>> getRecords(List<dynamic> keys) async {
    return await _store.records(keys).get(_db._instance)
        as List<Map<String, dynamic>>;
  }

  @override
  Future<List<Map<String, dynamic>>> findRecords({
    int? offset,
    int? limit,
  }) async {
    final records = await _store.find(
      _db._instance,
      finder: Finder(
        offset: offset,
        limit: limit,
      ),
    );
    return records.map((e) => e.value as Map<String, dynamic>).toList();
  }

  @override
  Future<void> deleteRecord(dynamic key) async {
    await _store.record(key).delete(_db._instance);
  }
}
