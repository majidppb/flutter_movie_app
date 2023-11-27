import 'package:sqflite/sqflite.dart';

class DB {
  static late final Database db;
  static const _dbName = 'movieapp.db';
  static const _version = 1;

  static const profiles = 'profiles';
  static const movies = 'movies';
  static const myList = 'my_list';

  // Initialize Database
  static init() async {
    db = await openDatabase(
      _dbName,
      version: _version,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) async {
        await db.execute('''
                        CREATE TABLE $profiles (
                          id INTEGER PRIMARY KEY AUTOINCREMENT,
                          name TEXT NOT NULL,
                          is_explicit_allowed INTEGER CHECK (is_explicit_allowed IN (0, 1)) DEFAULT 0
                        )''');

        await db.execute('''
                        CREATE TABLE $movies (
                          id INTEGER PRIMARY KEY,
                          adult INTEGER NOT NULL CHECK (adult IN (0, 1)),
                          backdrop_path TEXT,
                          genre_ids TEXT NOT NULL,
                          original_language TEXT NOT NULL,
                          original_title TEXT NOT NULL,
                          overview TEXT NOT NULL,
                          popularity REAL NOT NULL,
                          poster_path TEXT,
                          release_date TEXT NOT NULL,
                          title TEXT NOT NULL,
                          vote_average REAL NOT NULL,
                          vote_count INTEGER NOT NULL
                        )''');

        await db.execute('''
                        CREATE TABLE $myList (
                          profile INTEGER NOT NULL,
                          movie INTEGER NOT NULL,
                          created TEXT DEFAULT (datetime('now','localtime')),
                          PRIMARY KEY(profile,movie),
                          FOREIGN KEY (profile) REFERENCES $profiles (id) ON DELETE CASCADE,
                          FOREIGN KEY (movie) REFERENCES $movies (id) ON DELETE CASCADE
                        )''');
      },
    );
  }
}
