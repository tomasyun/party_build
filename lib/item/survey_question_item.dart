import 'package:flutter/material.dart';
import 'package:party_build/model/survey_question_model.dart';

// ignore: must_be_immutable
class SurveyQuestionItem extends StatefulWidget {
  SurveyQuestionData questionData;
  int position;

  SurveyQuestionItem({this.questionData, this.position});

  @override
  State<StatefulWidget> createState() => SurveyQuestionState();
}

class SurveyQuestionState extends State<SurveyQuestionItem> {
  int groupValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(15.0),
            child: Text(
              widget.position.toString() + ". " + widget.questionData.content,
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: _buildRadioList(),
            ),
          ),
        ],
      ),
    );
  }

  List<RadioListTile> _buildRadioList() {
    List<RadioListTile> _list = List<RadioListTile>();
    for (int i = 0; i < widget.questionData.questionOptionsList.length; i++) {
      var item = RadioListTile(
        value: i,
        groupValue: groupValue,
        onChanged: (T) {
          updateGroupValue(T);
        },
        title: Text(
          widget.questionData.questionOptionsList[i].content,
          style: TextStyle(fontSize: 15.0, color: Colors.black),
        ),
      );
      _list.add(item);
    }
    return _list;
  }

  void updateGroupValue(int value) {
    setState(() {
      groupValue = value;
    });
  }
}
