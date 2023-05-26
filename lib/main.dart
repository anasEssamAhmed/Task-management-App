import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/controller/task_provider.dart';
import 'package:to_do_app/model/database.dart';
import 'package:to_do_app/view/screen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.dp.initDP();
  runApp(ChangeNotifierProvider<TaskProvider>(
      create: (BuildContext context) {
        return TaskProvider();
      },
      child: MaterialApp(home: SplashPage())));
}
