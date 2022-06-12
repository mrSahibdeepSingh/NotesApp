import 'package:notes_app/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NoteDBHelper {
  static final NoteDBHelper instance = NoteDBHelper._init();
  static Database? _database;
  NoteDBHelper._init();

  static Database get db => _database!;

  // Check and create DB

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('mynotes3.db');

    return _database!;
  }

  Future<List<Map<String, dynamic>>> get notes async {
    return await db.query(
      tableName,
      // orderBy: 'creationDate ASC',
    );
  }

  // Initialize Database

  Future<Database> _initDB(String filePath) async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, filePath);

    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName(id integer primary key autoincrement, title text, description text, creationTime text)");
    // "create table notes4(${NoteFields.id} integer primary key autoincrement,${NoteFields.title} text,${NoteFields.description} text");
  }

  // Future<void> _upgradeDB(Database db, int oldVv, int newV) async {
  //   await db.execute("ALTER TABLE $tableName add COLUMN creationTime text");
  // }

  // Create Note
  Future<Note> create(Note note) async {
    final db = await instance.database;
    final id = await db.insert(tableName, note.toJson());

    return note.copy(id: id);
  }

  // Read All Notes
  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = "creationTime ASC";
    final result = await db.query(tableName, orderBy: orderBy);

    print(result);
    return result.map((json) => Note.fromjson(json)).toList();
  }

  // Read single note
  Future<Note> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromjson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  // Update Note

  Future<int> updateNote(Note note) async {
    final db = await instance.database;

    print("${note.id} =====================================");
    return db.update(
      tableName,
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  // Delete Note
  Future<int> deleteNote(int id) async {
    final db = await instance.database;

    return await db.delete(tableName, where: "id = ?", whereArgs: [id]);
  }

  // close DB

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
