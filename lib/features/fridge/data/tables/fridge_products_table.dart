import 'package:drift/drift.dart';

class FridgeProductsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  RealColumn get value => real()();
  TextColumn get unit => text()();
}
