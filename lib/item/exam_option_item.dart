import 'package:flutter/material.dart';
import 'package:party_build/global/toast.dart';
import 'package:party_build/model/exam_question_model.dart';

// ignore: must_be_immutable
class ExamOptionItem extends StatefulWidget {
  int groupValue;
  int value;
  OptionModel model;

  ExamOptionItem({this.value, this.model});

  @override
  State<StatefulWidget> createState() => ExamOptionState();
}

class ExamOptionState extends State<ExamOptionItem> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: widget.value,
      groupValue: widget.groupValue,
      onChanged: (T) {
        updateGroupValue(T);
      },
      title: Text(
        widget.model.content,
        style: TextStyle(fontSize: 15.0, color: Colors.black),
      ),
    );
  }

  void updateGroupValue(int value) {
    setState(() {
      widget.groupValue = value;
    });
  }
}
