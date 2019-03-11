import 'package:flutter/material.dart';
import 'package:party_build/bloc/exam_rst_info_bloc.dart';

// ignore: must_be_immutable
class ExamRstInfoPage extends StatefulWidget {
  String id;

  ExamRstInfoPage({this.id});

  @override
  State<StatefulWidget> createState() => ExamRstInfoState();
}

class ExamRstInfoState extends State<ExamRstInfoPage> {
  ExamRstInfoBloc _bloc = ExamRstInfoBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetExamRstInfoRequest(ruleId: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "考试结果",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
