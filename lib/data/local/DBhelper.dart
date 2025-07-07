import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  DbHelper._();
  static final DbHelper getInstance = DbHelper._();

  final String TABLE_TODAY_TASK = "todaytasks";
  final String TABLE_PREV_TASK = 'prevtasks';
  final String TABLE_PRE_TASK = "pretasks";

  final String COLUMN_SNO = 's_no';
  final String COLUMN_TITLE = 'title';
  final String COLUMN_DESCRIPTION = "desc";
  final String COLUMN_DATE = 'date';
  final String COLUMN_TIME = "time_credit";
  final String COLUMN_PRIORITY = "priority";
  final String COLUMN_SCHEDULE_DATE = "assigned_date";

  Database? myDB;

  Future<Database> getDB() async {
    if (myDB != null) {
      return myDB!;
    } else {
      myDB = await openDB();
      return myDB!;
    }
  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "TasksDB.db");

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $TABLE_TODAY_TASK (
            $COLUMN_SNO INTEGER PRIMARY KEY AUTOINCREMENT,
            $COLUMN_TITLE TEXT,
            $COLUMN_DESCRIPTION TEXT,
            $COLUMN_DATE TEXT,
            $COLUMN_TIME TEXT,
            $COLUMN_PRIORITY TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE $TABLE_PREV_TASK (
            $COLUMN_SNO INTEGER PRIMARY KEY AUTOINCREMENT,
            $COLUMN_TITLE TEXT,
            $COLUMN_DESCRIPTION TEXT,
            $COLUMN_DATE TEXT,
            $COLUMN_SCHEDULE_DATE TEXT,
            $COLUMN_TIME TEXT,
            $COLUMN_PRIORITY TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE $TABLE_PRE_TASK (
            $COLUMN_SNO INTEGER PRIMARY KEY AUTOINCREMENT,
            $COLUMN_TITLE TEXT,
            $COLUMN_DESCRIPTION TEXT,
            $COLUMN_DATE TEXT,
            $COLUMN_SCHEDULE_DATE TEXT,
            $COLUMN_TIME TEXT,
            $COLUMN_PRIORITY TEXT
          )
        ''');
      },
    );
  }

  // Insert task
  Future<bool> addTask({
    required String tTitle,
    required String tDate,
    required String tdesc,
    required String priority,
    // required String time
  }) async {
    var db = await getDB();
    int rowEffected = await db.insert(TABLE_TODAY_TASK, {
      COLUMN_TITLE: tTitle,
      COLUMN_DATE: tDate,
      COLUMN_DESCRIPTION: tdesc,
      COLUMN_PRIORITY: priority,
      // COLUMN_TIME: time
    });
    return rowEffected > 0;
  }

  // Read all tasks
  Future<List<Map<String, dynamic>>> getAllTasks() async {
    var db = await getDB();
    return await db.query(TABLE_TODAY_TASK);
  }
  Future<bool> update({required String tTitle ,
    required String prirority ,
    required  String tdesc ,
    required int sno})async{
    var db = await getDB();
    int rowEffected  = await db.update(TABLE_TODAY_TASK, {
      COLUMN_TITLE: tTitle,
      COLUMN_DESCRIPTION: tdesc,
      COLUMN_PRIORITY : prirority,
      // COLUMN_DATE : tDate
    }, where : "$COLUMN_SNO = $sno");
    return rowEffected>0;
  }
  Future<bool> delete({required int sno})async{
    var db = await getDB();
    int rowEffected = await db.delete(TABLE_TODAY_TASK,
      where: "$COLUMN_SNO = ?",whereArgs: ['$sno']    );
    return rowEffected>0;
  }
}
