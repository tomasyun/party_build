import 'package:flutter/material.dart';
import 'package:party_build/bloc/exam_bloc.dart';
import 'package:party_build/list/exam_ok_list.dart';
import 'package:party_build/list/exam_on_list.dart';
import 'package:party_build/model/exam_model.dart';

//考试
class ExamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExamPageState();
}

class ExamPageState extends State<ExamPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  ExamBloc _bloc = ExamBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetExam(type: "0");
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
    _controller.addListener(() {
      switch (_controller.index) {
        case 0: //待考
          _bloc.doGetExam(type: "0");
          break;
        case 1: //已考
          _bloc.doGetExam(type: "1");
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "考试",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: null,
        backgroundColor: Colors.red,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: "待考",
            ),
            Tab(
              text: "已考",
            )
          ],
          controller: _controller,
          indicatorColor: Colors.red,
          labelColor: Colors.white,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          Center(
            child: _buildExamList("0"),
          ),
          Center(
            child: _buildExamList("1"),
          )
        ],
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

//待考列表
  Widget _buildExamOnList(ExamModel model) {
    return ExamOnList(
      model: model,
    );
  }

//已考列表
  Widget _buildExamOkList(ExamModel model) {
    return ExamOkList(
      model: model,
    );
  }

  Widget _buildExamList(String type) {
    return _bloc.streamBuild(
        loading: () {
          return Container(
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ),
            ),
          );
        },
        success: (data) {
          if (type == "0") {
            return _buildExamOnList(data);
          } else if (type == "1") {
            return _buildExamOkList(data);
          } else {
            return null;
          }
        },
        error: (msg) {},
        empty: () {
          return Container(
            child: Center(
              child: Text("暂无数据"),
            ),
          );
        });
  }
}
