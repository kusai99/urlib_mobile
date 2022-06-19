import 'dart:io';

import 'package:face_net_authentication/pages/models/user.model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;

class DatabaseHelper {
  // static final _databaseName = "MyDatabase.db";
  // static final _databaseVersion = 1;

  static final table = 'users';
  static final columnId = 'id';
  static final columnUser = 'name';
  static final columnPassword = 'password';
  static final columnModelData = 'model_data';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // static late Database _database;
  // Future<Database> get database async {
  //   _database = await _initDatabase();
  //   return _database;
  // }

  // _initDatabase() async {
  //   Directory documentsDirectory = await getApplicationDocumentsDirectory();
  //   String path = join(documentsDirectory.path, _databaseName);
  //   return await openDatabase(path,
  //       version: _databaseVersion, onCreate: _onCreate);
  // }
  // _initDatabase() async {
  //   await Firebase.initializeApp();
  // }

  // Future _onCreate(Database db, int version) async {
  //   await db.execute('''
  //         CREATE TABLE $table (
  //           $columnId INTEGER PRIMARY KEY,
  //           $columnUser TEXT NOT NULL,
  //           $columnPassword TEXT NOT NULL,
  //           $columnModelData TEXT NOT NULL
  //         )
  //         ''');
  insertUser(User user) async {
    await _db.collection("Users").add(user.toMap());
  }

  Future<List<User>> getUsers() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Users").get();
    return snapshot.docs
        .map((docSnapshot) => User.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}

  

  // Future<int> insert(User user) async {
  //   Database db = await instance.database;
  //   return await db.insert(table, user.toMap());
  // }

  // Future<List<User>> queryAllUsers() async {
  //   Database db = await instance.database;
  //   List<Map<String, dynamic>> users = await db.query(table);
  //   return users.map((u) => User.fromMap(u)).toList();
  // }

  // Future<int> deleteAll() async {
  //   Database db = await instance.database;
  //   return await db.delete(table);
  // }

