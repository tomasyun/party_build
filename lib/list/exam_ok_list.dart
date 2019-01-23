import 'package:flutter/material.dart';
import 'package:party_build/item/exam_ok_item.dart';
import 'package:party_build/model/exam_model.dart';

// ignore: must_be_immutable
class ExamOkList extends StatelessWidget {
  ExamModel model;

  ExamOkList({this.model});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildExamOkList(),
    );
  }

  List<ExamOkItem> _buildExamOkList() {
    return model.data
        .map((item) => ExamOkItem(
              exam: item,
            ))
        .toList();
  }
}
