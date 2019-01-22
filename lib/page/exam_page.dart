import 'package:flutter/material.dart';
import 'package:party_build/bloc/exam_pending_bloc.dart';
import 'package:party_build/list/exam_pending_list.dart';
import 'package:party_build/model/exam_pending.dart';

//考试
class ExamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExamPageState();
}

class ExamPageState extends State<ExamPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  ExamPendingBloc _bloc = ExamPendingBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      switch (_controller.index) {
        case 0:
          _bloc.doGetExamPending(type: "0");
          break;
        case 1:
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
            child: _bloc.streamBuild(
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
                  return _buildPendingList(data);
                },
                error: (msg) {},
                empty: () {}),
          ),
          Center()
        ],
        controller: _controller,
      ),
    );
  }

  Widget _buildPendingList(Exam exam) {
    return ExamPendingList(
      exam: exam,
    );
  }
}
