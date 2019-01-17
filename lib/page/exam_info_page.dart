import 'package:flutter/material.dart';

class ExamInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExamInfoState();
}

class ExamInfoState extends State<ExamInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "考试信息",
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.black12,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  color: Colors.red,
                  height: 200,
                  child: Center(
                    child: Text(
                      "关于学习新形势下党内政治生活的若干准则的测试",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 180.0, left: 20.0, right: 20.0, bottom: 200.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              _buildContainer(
                                  "images/ic_total_score.png", "试卷总分", "100"),
                              Container(
                                width: 0.5,
                                height: 120,
                                color: Colors.black12,
                              ),
                              _buildContainer(
                                  "images/ic_limit_score.png", "及格分", "60")
                            ],
                          ),
                        ),
                        Container(
                          width: 330,
                          height: 0.5,
                          color: Colors.black12,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              _buildContainer(
                                  "images/ic_exam_duration.png", "考试时长", "60"),
                              Container(
                                width: 0.5,
                                height: 120,
                                color: Colors.black12,
                              ),
                              _buildContainer(
                                  "images/ic_question_num.png", "总题数", "60")
                            ],
                          ),
                        ),
                        Container(
                          width: 330,
                          height: 0.5,
                          color: Colors.black12,
                        ),
                        Container(
                          height: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "考试时间",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 30.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "2018-12-25",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "至",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "2018-12-26",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 600.0,left: 18.0,right: 15.0),
                  child:  RaisedButton(
                    onPressed: () => {},
                    child: Text("开始考试",
                      style: TextStyle(fontSize: 16, color: Colors.white),),
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    padding: EdgeInsets.fromLTRB(130.0, 15.0, 130.0, 15.0),),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildContainer(String url, String key, String value) {
    return Container(
      child: Row(
        children: <Widget>[
          Image.asset(
            url,
            width: 50.0,
            height: 50.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    key,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
