import 'package:flutter/material.dart';
import 'package:party_build/bloc/survey_bloc.dart';
import 'package:party_build/list/survey_list.dart';
import 'package:party_build/model/survey_model.dart';

class QuestionSurPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QuestionSurState();
}

class QuestionSurState extends State<QuestionSurPage> {
  SurveyBloc _bloc = SurveyBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doSurveyQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "问卷调查",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: _bloc.streamBuild(
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
            return _buildSurveyList(data);
          },
          empty: () {},
          error: (msg) {
            return Container(
              child: Center(
                child: Text("暂无数据"),
              ),
            );
          }),
    );
  }

  Widget _buildSurveyList(Survey survey) {
    return SurveyList(
      survey: survey,
    );
  }
}
