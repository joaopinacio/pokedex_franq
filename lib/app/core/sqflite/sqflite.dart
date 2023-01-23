import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

late final Database database;

void configureDatabase() async {
  database = await openDatabase(
    join(await getDatabasesPath(), 'pokemon_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE pokemons(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, type TEXT, move_1 TEXT, move_2 TEXT, move_3 TEXT, image_path TEXT)',
      );
    },
    version: 1,
  );
}
