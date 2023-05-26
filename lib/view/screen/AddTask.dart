import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/controller/task_provider.dart';
import 'package:to_do_app/model/task.dart';

class AddTaskPage extends StatelessWidget {
  TextEditingController taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Add Task ',
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: taskController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Task',
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (taskController.text.isNotEmpty) {
                    Task task = Task(taskController.text.toString(),
                        Provider.of<TaskProvider>(context , listen: false).loggedInUserEmail);
                    Provider.of<TaskProvider>(context,listen: false).addTask(task , context);
                  } else {
                    Fluttertoast.showToast(
                      msg: "Please add a task name",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                    );
                  }
                },
                child: const Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
