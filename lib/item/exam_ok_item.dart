import 'package:flutter/material.dart';
import 'package:party_build/model/exam_model.dart';
import 'package:party_build/page/exam_info_page.dart';

// ignore: must_be_immutable
class ExamOkItem extends StatelessWidget {
  Exam exam;

  ExamOkItem({this.exam});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              exam.title,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    exam.limitDate,
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.black45),
                                  ),
                                  margin: EdgeInsets.only(top: 3.0),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "已结束",
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.black45),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                    flex: 1,
                  ),
                  _buildScoreContainer(
                      exam.examScore.split(".")[0] + "分", exam.isPass)
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.black12,
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ExamInfoPage(
                  id: exam.id,
                  skipType: "1",
                )));
      },
    );
  }

  Widget _buildScoreContainer(String score, String isPass) {
    if (isPass == "0") {
      return Container(
          padding: EdgeInsets.all(30.0),
          margin: EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          child: Text(
            score,
            style: TextStyle(fontSize: 15.0, color: Colors.white),
          ));
    } else if (isPass == "1") {
      return Container(
          padding: EdgeInsets.all(30.0),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          child: Text(
            score,
            style: TextStyle(fontSize: 15.0, color: Colors.white),
          ));
    } else {
      return null;
    }
  }
}
