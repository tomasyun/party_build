import 'package:flutter/material.dart';
import 'package:party_build/global/rxbus.dart';
import 'package:party_build/model/exam_question_model.dart';
import 'package:party_build/model/exam_sub_model.dart';

// ignore: must_be_immutable
class ExamQuesItem extends StatefulWidget {
  QuestionList questions;
  int pos;

  ExamQuesItem({this.pos, this.questions});

  @override
  State<StatefulWidget> createState() => ExamQuesState();
}

class ExamQuesState extends State<ExamQuesItem> {
  int value;
  String answer;
  List<String> answers;
  List<OptionModel> models;

  @override
  void initState() {
    super.initState();
    answers = List<String>();
    models = widget.questions.questionOptionsList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Colors.white,
            margin: EdgeInsets.all(15.0),
            child: Text(
              widget.pos.toString() + ". " + widget.questions.content,
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
              children: _buildExamQuesOptionList(widget.questions.type),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildExamQuesOptionList(String type) {
    if (type == "单选题") {
      return _buildRadioList();
    } else if (type == "多选题") {
      return _buildCheckboxList();
    }
    return null;
  }

  List<RadioListTile> _buildRadioList() {
    List<RadioListTile> _list = List<RadioListTile>();
    for (int i = 0; i < models.length; i++) {
      var item = RadioListTile(
        value: i,
        groupValue: value,
        onChanged: (T) {
          updateGroupValue(T);
        },
        title: Text(
          models[i].name + "  " + models[i].content,
          style: TextStyle(fontSize: 15.0, color: Colors.black),
        ),
      );
      _list.add(item);
    }
    return _list;
  }

  void updateGroupValue(int value) {
    setState(() {
      this.value = value;

      answer = models[value].name;
      RxBus.post(ExamSubModel(answer: answer, questionId: widget.questions.id),
          tag: "单选题");
    });
  }

  List<CheckboxListTile> _buildCheckboxList() {
    List<CheckboxListTile> _list = List<CheckboxListTile>();
    for (int i = 0; i < models.length; i++) {
      var item = CheckboxListTile(
        value: models[i].isSelect,
        onChanged: (bool) {
          updateIsSelect(i, bool);
        },
        title: Text(
          models[i].name + "  " + models[i].content,
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
      models[i].isSelect = isSelect;
      if (answers.length > 0) answers.clear();
      for (int k = 0; k < models.length; k++) {
        if (models[k].isSelect == true) {
          answers.add(models[k].name);
          answer = switchStringFromList(answers);
        }
      }
      RxBus.post(ExamSubModel(answer: answer, questionId: widget.questions.id),
          tag: "多选题");
    });
  }

  String switchStringFromList(List<String> list) {
    String newAnswer = "";
    for (int i = 0; i < list.length; i++) {
      newAnswer = newAnswer + list[i];
    }
    return newAnswer;
  }
}
