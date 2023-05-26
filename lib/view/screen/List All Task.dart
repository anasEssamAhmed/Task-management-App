import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/controller/task_provider.dart';
import 'package:to_do_app/view/screen/AddTask.dart';
import 'package:to_do_app/view/widget/taskWidget.dart';

class listAllTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, provider, child) {
      provider.getAllTask(context);
      return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AddTaskPage();
              }));
            },
            child: const Icon(Icons.add)),
        body: provider.listTask == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: provider.listTask?.length ?? 0,
                itemBuilder: (context, index) {
                  return TaskWidget(provider.listTask![index]);
                }),
      );
    });
  }
}
