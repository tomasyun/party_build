import 'package:flutter/material.dart';
import 'package:party_build/bloc/course_hours_bloc.dart';
import 'package:party_build/bloc/course_info_bloc.dart';
import 'package:party_build/model/course_info_model.dart';
import 'package:party_build/model/response_rst_model.dart';

// ignore: must_be_immutable
class CourseInfoPage extends StatefulWidget {
  String courseId;
  String taskId;

  CourseInfoPage({this.courseId, this.taskId});

  @override
  State<StatefulWidget> createState() => CourseInfoState();
}

class CourseInfoState extends State<CourseInfoPage> with CourseHoursBloc {
  CourseInfoBloc _bloc = CourseInfoBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetCourseInfoRequest(
        id: widget.courseId, taskId: widget.taskId, flag: "0");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "课件学习",
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.red,
          ),
          body: _buildCourseInfoBody(),
        ),
        onWillPop: () {
          doGetCourseHoursRequest(
              id: widget.courseId, taskId: widget.taskId, flag: "1");
        });
  }

  Widget _buildCourseInfoBody() {
    return _bloc.streamBuild(loading: () {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      );
    }, success: (data) {
      return _buildCourseInfoContent(data);
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

  Widget _buildCourseInfoContent(CourseInfo info) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding:
              EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0, bottom: 50.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  info.data.title,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Text(
                  info.data.context,
                  style: TextStyle(
                      fontSize: 14.0, color: Colors.black, letterSpacing: 3.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onSuccess(ResponseRstModel model) {
    if (model.code == "0000") {
      Navigator.of(context).pop();
    }
  }
}