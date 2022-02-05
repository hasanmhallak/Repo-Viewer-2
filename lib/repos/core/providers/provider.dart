import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../infrastructure/database/sembast_database.dart';

final sembastProvider = Provider<SembastDatabase>((ref) {
  final db = SembastDatabase();

  // Close database when no longer is listened to.
  ref.onDispose(() {
    db.closeDb();
  });
  return db;
});
