import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

var data = [].obs;
var data2 = [].obs;
int count = 0;

class Dbhelp {
  // ignore: prefer_typing_uninitialized_variables
  var db;

  // ignore: prefer_typing_uninitialized_variables
  var db2;

  Future initdb() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "myDatabase.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "myDatabase.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }

// open the database

    db = await openDatabase(path, readOnly: true);
    db2 = await openDatabase(path, readOnly: true);
    print("asvdkasdgcasdcgasd $db");
    data.value = await db.rawQuery('SELECT * FROM bank_details');
    data2.value = await db2.rawQuery('SELECT * FROM smsinfo');
    // final List<
    //     Map<String,
    //         dynamic>> queryResult = await db.rawQuery(
    //     'SELECT * FROM bank_details WHERE title LIKE ? OR categoria LIKE ?',
    //     [
    //       '${'%' + data2[0]}%',
    //       '${'%' + data2[0]['bankname']}%'
    //     ]);
    // log('SMSMSMSMSMSM $data2');
    // print("asgfahsgfjaksv ${data.value[14]['title']}");
    // List<Map> maps = await db.query(tableTodo,
    //  columns: ['columnId', 'columnDone', 'columnTitle'],
    //  where: 'columnId = ?',
    //  whereArgs: [id]);
  }
}
