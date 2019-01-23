import 'package:flutter/material.dart';
import 'package:party_build/item/exam_on_item.dart';
import 'package:party_build/model/exam_model.dart';

// ignore: must_be_immutable
class ExamOnList extends StatelessWidget {
  ExamModel model;

  ExamOnList({this.model});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildExamOnList(),
    );
  }

  List<ExamOnItem> _buildExamOnList() {
    return model.data
        .map((item) => ExamOnItem(
              exam: item,
            ))
        .toList();
  }
}
