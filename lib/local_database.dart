import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CatDB {
  Future<Database> _initCatDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'cats_database.db');
    return await openDatabase(
      path,
      onCreate: (Database db, int version) {
        // Run the create table statement on database.
        return db.execute(
            'CREATE TABLE cats(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }
}
