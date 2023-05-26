import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/view/widget/taskWidget.dart';
import '../../controller/task_provider.dart';
import 'AddTask.dart';

class listTaskComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, provider, child) {
      provider.getCompleteTask(context);
      return Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return AddTaskPage();
                }));
              },
              child: const Icon(Icons.add)),
          body: provider.listTaskComplete == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: provider.listTaskComplete
                      ?.where((element) => element.isComplete!)
                      .length,
                  itemBuilder: (context, index) {
                    var s = provider.listTaskComplete
                        ?.where((element) => element.isComplete!)
                        .toList()[index];
                    return TaskWidget(s!);
                  }));
    });
  }
}
