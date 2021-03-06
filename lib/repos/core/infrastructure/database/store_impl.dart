import 'package:sembast/sembast.dart';

import 'database.dart';
import 'sembast_database.dart';

class SembastDbStore implements DataBase {
  final SembastDatabase _db;
  late StoreRef _store;
  SembastDbStore.integerStore(this._db, String name) {
    _store = intMapStoreFactory.store(name);
  }

  SembastDbStore.stringStore(this._db, String name) {
    _store = stringMapStoreFactory.store(name);
  }

  @override
  Future<void> saveRecords(
    List<dynamic> keys,
    List<Map<String, dynamic>> values,
  ) async {
    await _store.records(keys).put(_db.instance, values);
  }

  @override
  Future<void> saveRecord(
    dynamic key,
    Map<String, dynamic> value,
  ) async {
    await _store.record(key).put(_db.instance, value);
  }

  @override
  Future<Map<String, dynamic>?> getRecord(dynamic key) async {
    return await _store.record(key).get(_db.instance) as Map<String, dynamic>?;
  }

  @override
  Future<List<Map<String, dynamic>>> getRecords(List<dynamic> keys) async {
    return await _store.records(keys).get(_db.instance)
        as List<Map<String, dynamic>>;
  }

  @override
  Future<List<Map<String, dynamic>>> findRecords({
    int? offset,
    int? limit,
  }) async {
    final records = await _store.find(
      _db.instance,
      finder: Finder(
        offset: offset,
        limit: limit,
      ),
    );
    return records.map((e) => e.value as Map<String, dynamic>).toList();
  }

  @override
  Future<void> deleteRecords(List<dynamic> keys) async {
    await _store.records(keys).delete(_db.instance);
  }

  @override
  Future<void> deleteRecord(dynamic key) async {
    await _store.record(key).delete(_db.instance);
  }

  @override
  Future<int> countRecords() async {
    return _store.count(_db.instance);
  }
}
