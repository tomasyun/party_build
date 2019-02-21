import 'package:flutter/material.dart';
import 'package:party_build/item/exam_option_item.dart';
import 'package:party_build/model/exam_question_model.dart';

// ignore: must_be_immutable
class ExamQuestionItem extends StatelessWidget {
  QuestionList list;

  ExamQuestionItem({this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15.0),
            child: Text(
              list.content,
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
          Container(
            child: Column(
              children: _buildRadioList(),
            ),
          ),
        ],
      ),
    );
  }

  List<ExamOptionItem> _buildRadioList() {
    List<ExamOptionItem> _list = List<ExamOptionItem>();
    for (int i = 0; i < list.questionOptionsList.length; i++) {
      ExamOptionItem item = ExamOptionItem(
        value: i,
        model: list.questionOptionsList[i],
      );
      _list.add(item);
    }
    return _list;
  }
}
