import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_app/model/User.dart';
import 'package:to_do_app/model/task.dart';
import '../model/database.dart';
import '../view/screen/Home.dart';
import '../view/screen/SignIn.dart';

class TaskProvider extends ChangeNotifier {
  String? loggedInUserEmail;
  String? nameAccount;
  String? emailAccount;
  String? passwordAccount;
  List<Task>? listTask;
  List<Task>? listTaskNotComplete;
  List<Task>? listTaskComplete;
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isEditing = false;
  // navigate to Login page screen.
  navigateToLoginPage(BuildContext context) {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  // Sign up : insert Data To User Table
  insertDataToUserTable(User user, BuildContext context) async {
    bool trueOrNot = await DatabaseHelper.dp.signUp(user);
    if (trueOrNot) {
      Fluttertoast.showToast(
        msg: "User signed up successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      loggedInUserEmail = user.email;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => homeScreen()));
    } else {
      Fluttertoast.showToast(
        msg: "There is an error in the email or password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  // Sign in : Check User
  checkUser(BuildContext context, String email, String password) async {
    List<User> list = await DatabaseHelper.dp.signIn(
      email,
      password,
    );
    bool isUserFound = false;
    for (User user in list) {
      if (user.email == email && user.password == password) {
        isUserFound = true;
        Fluttertoast.showToast(
          msg: "User signed in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.black,
        );
        loggedInUserEmail = email;
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => homeScreen()));
        break;
      }
    }
    if (!isUserFound) {
      Fluttertoast.showToast(
        msg: "There is a problem with the password or email",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: Colors.black,
      );
    }
  }

  // get user name from email
  getUserNameFromEmail() async {
    List<User> userList = await DatabaseHelper.dp.getUser(loggedInUserEmail!);
    emailAccount = userList.first.email;
    nameAccount = userList.first.name;
    passwordAccount = userList.first.password;
    notifyListeners();
  }

  // update on task
  updateTask(String name) async {
    bool s = await DatabaseHelper.dp.updateTaskCompletion(name);
    if (s) {
      log("Update done");
    } else {
      log("There is problem");
    }
    notifyListeners();
  }

  // Custom Checkbox List Tile
  CustomCheckboxListTile(Task task, BuildContext context) {
    return CheckboxListTile(
        value: task.isComplete,
        onChanged: (value) {
          task.isComplete = !task.isComplete!;
          updateTask(task.name!);
        },
        title: Text(task.name!));
  }

  // custom ListTile
  customListTile(PageController page, int number, BuildContext context,
      String title, String subTitle, IconData? leading, IconData? trailing) {
    return ListTile(
      onTap: () {
        page.jumpToPage(number);
        notifyListeners();
        Navigator.of(context).pop();
      },
      title: Text(title),
      subtitle: Text(subTitle),
      leading: Icon(leading),
      trailing: Icon(trailing),
    );
  }

  // get All Task
  getAllTask(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    listTask = await DatabaseHelper.dp.getAllTasks(context);
    log(listTask.toString());
    notifyListeners();
  }

  // get Task Not Complete
  getIncompleteTask(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    listTaskNotComplete = await DatabaseHelper.dp.getIncompleteTasks(context);
    notifyListeners();
  }

  // get Task Complete
  getCompleteTask(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    listTaskComplete = await DatabaseHelper.dp.getCompletedTasks(context);
    notifyListeners();
  }

  // add Task
  addTask(Task task , BuildContext context) async {
    log("task add");
    bool addOrNot = await DatabaseHelper.dp.addTask(task);
    if(addOrNot){
      Fluttertoast.showToast(
        msg: "The task has been added successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }else {
      Fluttertoast.showToast(
        msg: "There is a problem adding the task",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
    listTask?.add(task);
    listTaskNotComplete?.add(task);
  }

  // Show User Info
  ShowUserInfo(){
    email.text = emailAccount ?? "No Email";
    name.text = nameAccount ?? "No Name";
    password.text = passwordAccount ?? "No Password";
    isEditing = true;
    notifyListeners();
  }

  // Update in User Data
  updateUserData(BuildContext context) async {
    User user = User(email.text, name.text, password.text);
    bool isUpdateOrNot = await DatabaseHelper.dp.updateUser(user, emailAccount!);
    if(isUpdateOrNot){
      Fluttertoast.showToast(
        msg: "update on user info",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      await DatabaseHelper.dp.updateTaskEmail(email.text, context);
      emailAccount = email.text;
      passwordAccount = password.text;
      nameAccount = name.text;
      loggedInUserEmail = email.text;
      isEditing = false;
      email.clear();
      password.clear();
      name.clear();
      notifyListeners();
    }else {
      Fluttertoast.showToast(
        msg: "There is a problem update the user info",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }

  }
}
