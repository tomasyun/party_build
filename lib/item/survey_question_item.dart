import 'package:flutter/material.dart';
import 'package:party_build/global/rxbus.dart';
import 'package:party_build/model/survey_answer_model.dart';
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
  String answer;
  List<String> answers;
  List<SurveyQuestionModel> _models;

  @override
  void initState() {
    super.initState();
    answers = List<String>();
    _models = widget.questionData.questionOptionsList;
  }

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
              children: _buildSurveyQuesOptionList(widget.questionData.typeId),
            ),
          ),
        ],
      ),
    );
  }

  List<RadioListTile> _buildRadioList() {
    List<RadioListTile> _list = List<RadioListTile>();
    for (int i = 0; i < _models.length; i++) {
      var item = RadioListTile(
        value: i,
        groupValue: groupValue,
        onChanged: (T) {
          updateGroupValue(T);
        },
        title: Text(
          _models[i].content,
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
      answer = _models[value].content;
      RxBus.post(AnswerModel(answer: answer, userId: widget.questionData.id),
          tag: "1");
    });
  }

  List<Widget> _buildSurveyQuesOptionList(String type) {
    if (type == "1") {
      return _buildRadioList();
    } else if (type == "2") {
      return _buildCheckboxList();
    }
    return null;
  }

  List<CheckboxListTile> _buildCheckboxList() {
    List<CheckboxListTile> _list = List<CheckboxListTile>();
    for (int i = 0; i < _models.length; i++) {
      var item = CheckboxListTile(
        value: _models[i].isSelect,
        onChanged: (bool) {
          updateIsSelect(i, bool);
        },
        title: Text(
          _models[i].name + "  " + _models[i].content,
          style: TextStyle(fontSize: 15.0, color: Colors.black),
        ),
        controlAffinity: ListTileControlAffinity.platform,
      );
      _list.add(item);
    }
    return _list;
  }

  void updateIsSelect(int i, bool isSelect) {
    setState(() {
      _models[i].isSelect = isSelect;
      if (answers.length > 0) answers.clear();
      for (int k = 0; k < _models.length; k++) {
        if (_models[k].isSelect == true) {
          answers.add(_models[k].content);
          answer = switchStringFromList(answers);
        }
      }
      RxBus.post(AnswerModel(answer: answer, userId: widget.questionData.id),
          tag: "2");
    });
  }

  String switchStringFromList(List<String> list) {
    String newAnswer = "";
    for (int i = 0; i < list.length; i++) {
      newAnswer = newAnswer + list[i] + "|";
    }
    return newAnswer;
  }
}
