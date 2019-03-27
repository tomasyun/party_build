import 'package:flutter/material.dart';
import 'package:party_build/bloc/survey_bloc.dart';
import 'package:party_build/item/survey_item.dart';
import 'package:party_build/model/survey_model.dart';
import 'package:party_build/refresh/behavior.dart';
import 'package:party_build/refresh/header.dart';
import 'package:party_build/refresh/refresher.dart';

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
      body: _bloc.streamBuild(loading: () {
        return Container(
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
          ),
        );
      }, success: (data) {
        return _buildStateView(data);
      }, empty: () {
        return Container(
          child: Center(
            child: Text("暂无数据"),
          ),
        );
      }, error: (msg) {
        return Container(
          child: Center(
            child: Text(msg),
          ),
        );
      }),
    );
  }

  List<SurveyItem> _buildSurveyListView(Survey survey) {
    return survey.data
        .map((item) => SurveyItem(
              model: item,
            ))
        .toList();
  }

  Widget _buildStateView(Survey survey) {
    if (survey.code == "0000") {
      if (survey.data != null && survey.data.isNotEmpty) {
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
              children: _buildSurveyListView(survey),
            ),
            onRefresh: () async {
              await new Future.delayed(const Duration(seconds: 1), () {
                setState(() {
                  _bloc.doSurveyQuestion();
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
