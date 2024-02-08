import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

enum StorageKeys {
  language('language'),
  movies('movies');

  const StorageKeys(this.key);

  final String key;
}

late final SharedPreferences $storage;

late final Database $database;

class DBService {
  static Future<void> initialize() async {
    $storage = await SharedPreferences.getInstance();

    $database = await openDatabase(
      join(await getDatabasesPath(), 'database.db'),
      onCreate: (db, version) => db.execute(
        'CREATE TABLE ${StorageKeys.movies.key}('
            'id INTEGER,'
            'adult INTEGER,'
            'backdropPath TEXT,'
            'genreIds TEXT,'
            'originalLanguage TEXT,'
            'originalTitle TEXT,'
            'overview TEXT,'
            'popularity REAL,'
            'posterPath TEXT,'
            'releaseDate TEXT,'
            'title TEXT,'
            'video INTEGER,'
            'voteAverage REAL,'
            'voteCount INTEGER,'
            'isSelected INTEGER'
            ')',
      ),
      version: 1,
    );
  }


}

class SqfliteDataBase {
  static final SqfliteDataBase _singleton = SqfliteDataBase._internal();

  factory SqfliteDataBase() {
    return _singleton;
  }
  SqfliteDataBase._internal();
  Database? _database;

  Future<void> initializeDatabase() async {
    // Open the database and perform any initialization tasks
    _database = await openDatabase(
      join(await getDatabasesPath(), 'example_database.db'),
      onCreate: (db, version) {
        // Create tables or perform any necessary schema changes here
        return db.execute(
          "CREATE TABLE items(id INTEGER PRIMARY KEY, name TEXT)",
        );
      },
      version: 1,
    );
  }
  Future<void> insertUser(String token) async {
    // Insert some users into the table
    await _database!.insert(
      'token',
      {
        'Bearer': token,

      },

    );
  }

  Future<List<Map<String, dynamic>>> getToken() async {
    return await _database!.query('token');
  }


}