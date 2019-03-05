import 'package:flutter/material.dart';
import 'package:party_build/model/exam_question_model.dart';

// ignore: must_be_immutable
class ExamQuestionItem extends StatefulWidget {
  QuestionList list;
  int position;

  ExamQuestionItem({this.position, this.list});

  @override
  State<StatefulWidget> createState() => ExamQuestionState();
}

class ExamQuestionState extends State<ExamQuestionItem> {
  int groupValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15.0),
            child: Text(
              widget.position.toString() + ". " + widget.list.content,
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
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
    for (int i = 0; i < widget.list.questionOptionsList.length; i++) {
      var item = RadioListTile(
        value: i,
        groupValue: groupValue,
        onChanged: (T) {
          updateGroupValue(T);
        },
        title: Text(
          widget.list.questionOptionsList[i].content,
          style: TextStyle(fontSize: 14.0, color: Colors.black),
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
