import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_text.dart';
import 'package:party_build/bloc/studies_bloc.dart';
import 'package:party_build/model/studies_model.dart';
import 'package:party_build/page/course_info_page.dart';
import 'package:party_build/page/studies_rst_page.dart';

// ignore: must_be_immutable
class StudiesPage extends StatefulWidget {
  String taskId;

  StudiesPage({this.taskId});

  @override
  State<StatefulWidget> createState() => StudiesState();
}

class StudiesState extends State<StudiesPage> {
  bool _isExpandedTask = false;
  bool _isExpandedCourse = true;

  StudiesBloc _bloc = StudiesBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetStudiesTaskRequest(id: widget.taskId);
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
      body: _buildStudiesPageBody(),
    );
  }

  Widget _buildStudiesPageBody() {
    return _bloc.streamBuild(loading: () {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      );
    }, success: (data) {
      return _buildStudiesPage(data);
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

  Widget _buildStudiesPage(Studies studies) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black12,
        child: Column(
          children: <Widget>[
            Container(
              child: ExpansionPanelList(
                  expansionCallback: (int panelIndex, bool isExpanded) {
                    setState(() {
                      _isExpandedTask = !isExpanded;
                    });
                  },
                  children: [
                    ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 6.0,
                                  height: 20.0,
                                  color: Colors.red,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    "任务内容",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        body: Container(
                          padding: EdgeInsets.all(30.0),
                          width: double.infinity,
                          child: HtmlText(
                            data: studies.data.content,
                          ),
                        ),
                        isExpanded: _isExpandedTask),
                  ]),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: ExpansionPanelList(
                expansionCallback: (int panelIndex, bool isExpanded) {
                  setState(() {
                    _isExpandedCourse = !isExpanded;
                  });
                },
                children: [
                  ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 6.0,
                                height: 20.0,
                                color: Colors.red,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15.0),
                                child: Text(
                                  "学习课件",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      body: new Padding(
                        padding: EdgeInsets.all(30.0),
                        child: _courseListBody(studies),
                      ),
                      isExpanded: _isExpandedCourse),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      StudiesRslPage(
                        taskId: widget.taskId,
                      ))),
              child: Container(
                margin: EdgeInsets.only(bottom: 10.0),
                color: Colors.white,
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 6.0,
                      height: 20.0,
                      color: Colors.red,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0),
                      child: Text(
                        "学习成果",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.keyboard_arrow_right),
                            margin: EdgeInsets.only(right: 10.0),
                          ),
                        ],
                      ),
                      flex: 1,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CourseItem extends StatelessWidget {
  CourseModel model;
  String taskId;

  CourseItem({this.model, this.taskId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                CourseInfoPage(
                  courseId: model.courseId,
                  taskId: taskId,
                )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          model.title,
          style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
              decoration: TextDecoration.underline,
              decorationColor: Colors.lightBlue,
              decorationStyle: TextDecorationStyle.solid),
        ),
      ),
    );
  }
}

Widget _courseListBody(Studies studies) {
  return CourseList(
    studies: studies,
  );
}

// ignore: must_be_immutable
class CourseList extends StatelessWidget {
  Studies studies;

  CourseList({this.studies});

  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: _buildCourseListBody(),
    );
  }

  List<CourseItem> _buildCourseListBody() {
    return studies.data.courseList
        .map((item) =>
        CourseItem(
          model: item,
          taskId: studies.data.id,
        ))
        .toList();
  }
}
