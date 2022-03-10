import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastDatabase {
  late Database _instance;
  Database get instance => _instance;

  bool _hasBeenInitialized = false;

  /// initialize database.
  Future<void> init() async {
    if (_hasBeenInitialized) {
      return;
    } else {
      final directory = await getApplicationDocumentsDirectory();
      directory.create(recursive: true);
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
