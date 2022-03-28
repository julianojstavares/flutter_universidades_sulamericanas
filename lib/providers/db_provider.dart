import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/universidade.dart';


class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async =>
      _database ??= await initDB();

  // Create the database and the University table
  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'University_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE University('
          'id INTEGER PRIMARY KEY,'
          'country TEXT,'
          'name TEXT,'
          'web_page TEXT'
          ')');
    });
  }

  // Insert University on database
  createUniversity(UniversidadeModel newUniversity) async {
    await deleteAllUniversities();
    final db = await database;
    final res = await db.insert('University', newUniversity.toJson());

    return res;
  }

  // Delete all Universities
  Future<int> deleteAllUniversities() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM University');

    return res;
  }

  Future<List<UniversidadeModel>> getAllUniversities() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM University");

    List<UniversidadeModel> list =
        res.isNotEmpty ? res.map((c) => UniversidadeModel.fromJson(c)).toList() : [];

    return list;
  }
}