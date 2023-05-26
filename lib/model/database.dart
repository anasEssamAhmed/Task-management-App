import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/controller/task_provider.dart';
import 'package:to_do_app/model/task.dart';
import 'User.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static DatabaseHelper dp = DatabaseHelper._();
  late Database database;

  initDP() async {
    String databasePath = await getDatabasesPath();
    String myDatabasePath = "$databasePath/Task.db";
    log(myDatabasePath.toString());
    database = await openDatabase(
      myDatabasePath,
      version: 3,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE User (email TEXT PRIMARY KEY, name TEXT, password TEXT)');
        db.execute(
            'CREATE TABLE Task (name TEXT PRIMARY KEY, isComplete INTEGER,user_email TEXT)');
      },onUpgrade: (db, oldVersion, newVersion) {
        if(oldVersion < 3){
          db.execute(
              'CREATE TABLE Task (name TEXT PRIMARY KEY, isComplete INTEGER,user_email TEXT)');
        }
      },
    );
  }

  // add user in the table user
  Future<bool> signUp(User user) async {
    try {
      int insertedRows = await database.insert("User", user.toMap());
      return insertedRows > -1;
    } catch (e) {
      log("Error inserting user: $e");
      return false;
    }
  }

  // get data from table user
  Future<List<User>> getUser(String email) async {
    List<Map> query =
        await database.query("User", where: "email = ?", whereArgs: [email]);
    List<User> listUser = query.map((e) => User.fromMap(e)).toList();
    return listUser;
  }

  // sign in
  Future<List<User>> signIn(String email, String password) async {
    List<Map> query = await database.query(
      "User",
      where: "email = ? and password = ?",
      whereArgs: [email, password],
    );
    List<User> listUser = query.map((e) => User.fromMap(e)).toList();
    return listUser;
  }

  // update user
  Future<bool> updateUser(User user, String email) async {
    try {
      int updatedRows = await database.update(
        "User",
        user.toMap(),
        where: "email = ?",
        whereArgs: [email],
      );
      return updatedRows > 0;
    } catch (e) {
      log("Error updating user: $e");
      return false;
    }
  }

  // -- Table Task --

  // Add task to the task table
  Future<bool> addTask(Task task) async {
    try {
      int insertedRows = await database.insert("Task", task.toMap());
      return insertedRows > -1;
    } catch (e) {
      log("Error inserting task: $e");
      return false;
    }
  }

  // Update task completion status
  Future<bool> updateTaskCompletion(String name) async {
    try {
      List<Map> query = await database.query("Task",
          where: "name = ?", whereArgs: [name]);
      if (query.isNotEmpty) {
        bool currentCompletionStatus = query.first["isComplete"] == 1;
        bool newCompletionStatus = !currentCompletionStatus;
        int updatedRows = await database.update(
          "Task",
          {"isComplete": newCompletionStatus == true ? 1 : 0},
          where: "name = ?",
          whereArgs: [name],
        );
        return updatedRows > 0;
      }
      return false;
    } catch (e) {
      log("Error updating task: $e");
      return false;
    }
  }

  // Get completed tasks
  Future<List<Task>> getCompletedTasks(BuildContext context) async {
    List<Map> query = await database.query("Task", where: "isComplete = ? and user_email = ?", whereArgs: [1,Provider.of<TaskProvider>(context , listen: false).loggedInUserEmail]);
    List<Task> completedTasks =  query.map((e) => Task.formMap(e)).toList();
    return completedTasks;
  }

  // Get incomplete tasks
  Future<List<Task>> getIncompleteTasks(BuildContext context) async {
    List<Map> query = await database.query("Task", where: "isComplete = ? and user_email = ?", whereArgs: [0,Provider.of<TaskProvider>(context, listen: false).loggedInUserEmail]);
    List<Task> incompleteTasks = query.map((e) => Task.formMap(e)).toList();
    return incompleteTasks;
  }

  // Get all tasks
  Future<List<Task>> getAllTasks(BuildContext context) async {
    List<Map> query = await database.query("Task" , where: "user_email = ?" , whereArgs: [Provider.of<TaskProvider>(context , listen: false).loggedInUserEmail]);
    List<Task> allTasks = query.map((e) => Task.formMap(e)).toList();
    return allTasks;
  }

  // update task in case update email
  updateTaskEmail(String newEmail , BuildContext context) async{
    await database.update("Task", {"user_email" : newEmail} , where: "user_email = ?" , whereArgs: [Provider.of<TaskProvider>(context , listen: false).loggedInUserEmail]);
  }
}
