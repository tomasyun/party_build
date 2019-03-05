import 'package:flutter/material.dart';
import 'package:party_build/item/task_item.dart';
import 'package:party_build/model/task_model.dart';

// ignore: must_be_immutable
class TaskList extends StatelessWidget {
  Task task;

  TaskList({this.task});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildTaskList(),
    );
  }

  List<TaskItem> _buildTaskList() {
    return task.data
        .map((item) => TaskItem(
              model: item,
            ))
        .toList();
  }
}
