import 'dart:ffi';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {

//   singeleton
  DbHelper._();

  static final DbHelper getInstance = DbHelper._();
  // Table column
  final String TABLE_TODAY_TASK = "todaytasks";
  final String TABLE_PREV_TASK = 'prevtasks';
  final String TABLE_PRE_TASK = "pretasks";
  final String COLUMN_SNO = 's_no';
  final String COLUMN_TITLE = 'title';
  final String COLUMN_DESCRIPTION = "desc";
  final String COLUMN_DATE = 'date';
  final String COLUMN_TIME = "time_credit";
  final String COLUMN_PRIORITY = "prirority";
  final String COLUMN_SCHEDULDE_DATE = "assigned_date";

  Database? myDB;

//     db open
  Future<Database> getDB()async{
    if(myDB!= null){
      return myDB!;
    }
    else {
      myDB =await openDB();
      return myDB!;
    }
  }

  Future <Database> openDB() async{
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "TasksDB.db");
    return await openDatabase(dbPath, onCreate: (db, version){
      //   Creating Tables
      db.execute('''
          create table $TABLE_TODAY_TASK(
          $COLUMN_TITLE text ,
          $COLUMN_DESCRIPTION  text,
          $COLUMN_DATE integer , 
          $COLUMN_TIME integer,
          $COLUMN_PRIORITY text)
          ''');
      db.execute('''
          create table $TABLE_TODAY_TASK(
          $COLUMN_TITLE text ,
          $COLUMN_DESCRIPTION  text,
          $COLUMN_DATE integer ,
          $COLUMN_SCHEDULDE_DATE integer, 
          $COLUMN_TIME integer,
          $COLUMN_PRIORITY text)
          ''');
      db.execute('''
          create table $TABLE_TODAY_TASK(
          $COLUMN_TITLE text ,
          $COLUMN_DESCRIPTION  text,
          $COLUMN_DATE integer ,
          $COLUMN_SCHEDULDE_DATE integer, 
          $COLUMN_TIME integer,
          $COLUMN_PRIORITY text)
          ''');



    },
        version: 1);

  }

  //    Queries
  //   insertion
  Future<bool> addTask ({
    required String tTitle ,
    required int tDate,
    required String tdesc ,
    required String priority,
    required int time
  })async{
    var db = await getDB();

    int rowEffected = await db.insert(TABLE_TODAY_TASK, {
      COLUMN_TITLE : tTitle,
      COLUMN_DATE : tDate,
      COLUMN_DESCRIPTION : tdesc,
      COLUMN_PRIORITY : priority,
      COLUMN_TIME : time
    });
    return rowEffected>0;
  }
  // reading data
  Future<List<Map<String, dynamic>>> getAllTasks() async{
    var db = await getDB();
   List<Map<String, dynamic>> Data = await db.query(TABLE_TODAY_TASK,columns: []);
   return Data;
  }



}