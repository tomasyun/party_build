import 'package:flutter/material.dart';
import 'package:party_build/model/survey_model.dart';
import 'package:party_build/page/online_survey_page.dart';

// ignore: must_be_immutable
class SurveyItem extends StatelessWidget {
  SurveyModel model;

  SurveyItem({this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                OnlineSurveyPage(
                  surveyId: model.id,
                )));
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      model.title,
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  model.limitDate,
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.black45),
                                ),
                                padding: EdgeInsets.only(top: 3.0),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "投票截止",
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.black45),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "参与人数",
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.black45),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    model.participants,
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.black45),
                                  ),
                                  padding: EdgeInsets.only(top: 3.0),
                                )
                              ],
                            ),
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                  )
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
    );
  }
}
