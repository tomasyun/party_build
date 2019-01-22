import 'package:flutter/material.dart';
import 'package:party_build/item/exam_pending_item.dart';
import 'package:party_build/model/exam_pending.dart';

// ignore: must_be_immutable
class ExamPendingList extends StatelessWidget {
  Exam exam;

  ExamPendingList({this.exam});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildExamPendingList(),
    );
  }

  List<ExamPendingItem> _buildExamPendingList() {
    return exam.data
        .map((item) => ExamPendingItem(
              model: item,
            ))
        .toList();
  }
}
