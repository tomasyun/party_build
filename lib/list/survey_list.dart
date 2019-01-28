import 'package:flutter/material.dart';
import 'package:party_build/item/survey_item.dart';
import 'package:party_build/model/survey_model.dart';

// ignore: must_be_immutable
class SurveyList extends StatelessWidget {
  Survey survey;

  SurveyList({this.survey});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildSurveyListView(),
    );
  }

  List<SurveyItem> _buildSurveyListView() {
    return survey.data
        .map((item) => SurveyItem(
              model: item,
            ))
        .toList();
  }
}
