import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/controller/task_provider.dart';
import 'package:to_do_app/model/task.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  TaskWidget(this.task);
  @override
  Widget build(BuildContext context) {
    return Provider.of<TaskProvider>(context).CustomCheckboxListTile(task, context);
  }

}