
import 'package:flutter/material.dart';
import 'package:to_do_app/data/dataSource.dart';
import 'package:to_do_app/view/widget/taskWidget.dart';

class listAllTask extends StatelessWidget {
  Function function;
  listAllTask(this.function);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: DataSource.listToTask.length,
      itemBuilder: (context, index) {
        return TaskWidget(DataSource.listToTask[index],function);
      });
  }

}