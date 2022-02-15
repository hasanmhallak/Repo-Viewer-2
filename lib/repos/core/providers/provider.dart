import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../infrastructure/database/sembast_database.dart';

/// - Provides [Database] instance.
/// - Closes the [Database] when no longer is used.
final sembastProvider = Provider<SembastDatabase>((ref) {
  final db = SembastDatabase();

  ref.onDispose(() {
    db.closeDb();
  });
  return db;
});

/// Registers all the necessary components in which the app needs
/// to function correctly.
///
/// This would hold [Database] registration, [Interceptors]... etc.
final initializationProvider = Provider((ref) async {
  await ref.read(sembastProvider).init();
});

/// Dio instance that must be intercepted to add `userName` and `credentials`.
final dioForStarredProvider = Provider<Dio>((ref) {
  return Dio();
});
