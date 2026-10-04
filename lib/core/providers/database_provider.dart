import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../database/app_database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();

  ref.onDispose(() => db.close());

  return db;
});
