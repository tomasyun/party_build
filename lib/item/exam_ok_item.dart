import 'package:flutter/material.dart';
import 'package:party_build/model/exam_model.dart';

// ignore: must_be_immutable
class ExamOkItem extends StatelessWidget {
  Exam exam;

  ExamOkItem({this.exam});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text("十九大会议精神的测试"),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text("2018-11-11"),
                            ),
                            Container(
                              child: Text("已结束"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                  child: Text("80分"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
