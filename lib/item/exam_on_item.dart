import 'package:flutter/material.dart';
import 'package:party_build/model/exam_model.dart';
import 'package:party_build/page/exam_info_page.dart';

// ignore: must_be_immutable
class ExamOnItem extends StatelessWidget {
  Exam exam;

  ExamOnItem({this.exam});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            ExamInfoPage(id: exam.id, skipType: "0",)));
              },
              title: Text(
                exam.title,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
              subtitle: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Container(
                      child: Text(
                        exam.limitDate,
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0, top: 15.0),
                    child: Text(
                      "截止时间",
                      style: TextStyle(color: Colors.black45),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.black12,
            height: 0.5,
          )
        ],
      ),
    );
  }
}
