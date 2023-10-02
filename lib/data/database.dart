import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'data.dart';

class DBHelper{

  static Database? _db;

  Future<Database?> get db async{
    if(_db != null){
      return _db;
    }

    _db =await initDatabase();
    return null;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "note.db");
    var db = await openDatabase(path, version: 1, onCreate:  _createDatabase);
    return db;
  }

  _createDatabase(Database db, int version) async{
    await db.execute("CREATE TABLE  notes(id INTEGER PRIMARY KEY AUTOINCREMENT, tgl TEXT NOT NULL, judul TEXT NOT NULL, desc TEXT NOT NULL)",
    );
  }

  Future<Data> insert(Data data) async{
    var dbClient = await db;
    await dbClient?.insert("notes", data.toMap());
    return data;
  }

  Future<List<Data>> getDataList() async{
    await db;
    final List<Map<String,Object?>> QueryResult = await _db!.rawQuery('SELECT * FROM notes');
    return QueryResult.map((e) => Data.fromMap(e)).toList();
  }

  Future<int> delete(int id) async{
    var dbClient =await db;
    return await dbClient!.delete('notes',where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Data data ) async{
    var dbClient = await db;
    return await dbClient!.update('notes', data.toMap(),where: 'id = ?', whereArgs: [data.id]);
  }

}