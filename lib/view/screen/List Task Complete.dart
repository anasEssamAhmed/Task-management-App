import 'package:flutter/material.dart';
import 'package:to_do_app/data/dataSource.dart';
import 'package:to_do_app/view/widget/taskWidget.dart';

class listTaskComplete extends StatelessWidget {
  Function function;
  listTaskComplete(this.function);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: DataSource.listToTask.where((element) => element.isComplete).length,
      itemBuilder: (context, index) {
        return TaskWidget(DataSource.listToTask.where((element) => element.isComplete).toList()[index], function);
      });
  }

}