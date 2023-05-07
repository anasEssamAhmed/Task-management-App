import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  Function function;
  TaskWidget(this.task, this.function);
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(value: task.isComplete, onChanged: (value) {
      task.isComplete = !task.isComplete;
      function();
    }, title: Text(task.name));
  }

}