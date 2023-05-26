import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/controller/task_provider.dart';
import 'package:to_do_app/view/widget/taskWidget.dart';
import 'AddTask.dart';

class listTaskNotComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, provider, child) {
      provider.getIncompleteTask(context);
      return Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return AddTaskPage();
                }));
              },
              child: const Icon(Icons.add)),
          body: provider.listTaskNotComplete == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: provider.listTaskNotComplete
                      ?.where((element) => !element.isComplete!)
                      .length,
                  itemBuilder: (context, index) {
                    var s = provider.listTaskNotComplete
                        ?.where((element) => !element.isComplete!)
                        .toList()[index];
                    return TaskWidget(s!);
                  }));
    });
  }
}
