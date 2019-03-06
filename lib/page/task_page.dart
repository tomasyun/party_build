import 'package:flutter/material.dart';
import 'package:party_build/bloc/task_bloc.dart';
import 'package:party_build/list/task_list.dart';
import 'package:party_build/model/task_model.dart';

class TaskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TaskState();
}

class TaskState extends State<TaskPage> {
  TaskBloc _bloc = TaskBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetTaskListRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "学习任务",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: _buildTaskBody(),
    );
  }

  Widget _buildTaskBody() {
    return _bloc.streamBuild(loading: () {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      );
    }, success: (data) {
      return Container(
        color: Colors.black12,
        child: _buildTaskListView(data),
      );
    }, error: (msg) {
      return Container(
        child: Center(
          child: Text(msg),
        ),
      );
    }, empty: () {
      return Container(
        child: Center(
          child: Text("暂无数据"),
        ),
      );
    });
  }

  Widget _buildTaskListView(Task task) {
    return TaskList(
      task: task,
    );
  }
}
