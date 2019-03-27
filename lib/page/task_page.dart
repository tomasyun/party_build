import 'package:flutter/material.dart';
import 'package:party_build/bloc/task_bloc.dart';
import 'package:party_build/item/task_item.dart';
import 'package:party_build/model/task_model.dart';
import 'package:party_build/refresh/behavior.dart';
import 'package:party_build/refresh/header.dart';
import 'package:party_build/refresh/refresher.dart';

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
        child: _buildStateView(data),
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

  List<TaskItem> _buildTaskList(Task task) {
    return task.data
        .map((item) => TaskItem(
              model: item,
            ))
        .toList();
  }

  Widget _buildStateView(Task task) {
    if (task.code == "0000") {
      if (task.data != null && task.data.isNotEmpty) {
        return Center(
          child: EasyRefresh(
            key: GlobalKey<EasyRefreshState>(),
            behavior: ScrollOverBehavior(),
            refreshHeader: ClassicsHeader(
              key: GlobalKey<RefreshHeaderState>(),
              bgColor: Colors.transparent,
              textColor: Colors.black87,
              moreInfoColor: Colors.black54,
              showMore: true,
            ),
            child: ListView(
              children: _buildTaskList(task),
            ),
            onRefresh: () async {
              await new Future.delayed(const Duration(seconds: 1), () {
                setState(() {
                  _bloc.doGetTaskListRequest();
                });
              });
            },
          ),
        );
      } else {
        return Container(
          child: Center(
            child: Text("暂无数据"),
          ),
        );
      }
    } else {
      return Container(
        width: 0.0,
        height: 0.0,
      );
    }
  }
}
