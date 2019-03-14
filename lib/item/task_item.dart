import 'package:flutter/material.dart';
import 'package:party_build/model/task_model.dart';
import 'package:party_build/page/studies_page.dart';

// ignore: must_be_immutable
class TaskItem extends StatelessWidget {
  TaskModel model;

  TaskItem({this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => StudiesPage(
                  taskId: model.id,
                )));
      },
      child: Container(
        margin: EdgeInsets.only(top: 15.0),
        width: double.infinity,
        padding: EdgeInsets.all(15.0),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              "必修",
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.white),
                            ),
                            color: Colors.red,
                            padding: EdgeInsets.only(
                                left: 5.0, top: 2.0, right: 5.0, bottom: 2.0),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.0),
                            child: Text(
                              model.title,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              "截止日期",
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black45),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.0, top: 3.0),
                            child: Text(
                              model.limitDate,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black45),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              "课时时长",
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black45),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.0, top: 3.0),
                            child: Text(
                              strToNumber(model.curHours).toStringAsFixed(2),
                              style:
                                  TextStyle(fontSize: 14.0, color: Colors.red),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 3.0),
                            child: Text(
                              "/" + model.totalHours,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black45),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              flex: 1,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 3.0, bottom: 3.0),
              child: Text(
                "去学习",
                style: TextStyle(fontSize: 14.0, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                border: new Border.all(width: 0.5, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double strToNumber(String str) {
    return double.parse(str);
  }
}
