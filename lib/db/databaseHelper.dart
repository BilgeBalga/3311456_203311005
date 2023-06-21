import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._();

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'notes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE IF NOT EXISTS notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT)',
        );
      },
    );
  }

  // Oluşturulan veritabanındaki verileri listelemek için
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    final Database db = await database;
    return await db.query('notes');
  }

  Future<void> insertNote({
    required String title,
    required String body,
  }) async {
    final Database db = await database;
    await db.insert(
      'notes',
      {'title': title, 'body': body},
    );
  }

  Future<void> deleteNote(int id) async {
    final Database db = await database;
    await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
