import 'package:flutter/material.dart';
import 'package:party_build/bloc/exam_info_bloc.dart';
import 'package:party_build/model/exam_info_model.dart';
import 'package:party_build/page/online_exam_page.dart';

// ignore: must_be_immutable
class ExamInfoPage extends StatefulWidget {
  String id;
  String skipType;

  ExamInfoPage({this.id, this.skipType});

  @override
  State<StatefulWidget> createState() => ExamInfoState();
}

class ExamInfoState extends State<ExamInfoPage> {
  ExamInfoBloc _bloc = ExamInfoBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.getExamInfoRequest(id: widget.id);
  }

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
        body: _buildExamInfo());
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

  Widget _buildExamInfo() {
    return _bloc.streamBuild(
        loading: () {
          return Container(
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ),
            ),
          );
        },
        success: (data) {
          return _inflateInfo(data);
        },
        empty: () {},
        error: (msg) {
          return Container(
            child: Center(
              child: Text(msg),
            ),
          );
        });
  }

  Widget _inflateInfo(ExamInfo info) {
    return SingleChildScrollView(
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
                  info.data.title,
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
                          _buildContainer("images/ic_total_score.png", "试卷总分",
                              info.data.totalScore),
                          Container(
                            width: 0.5,
                            height: 120,
                            color: Colors.black12,
                          ),
                          _buildContainer("images/ic_limit_score.png", "及格分",
                              info.data.limitScore)
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
                          _buildContainer("images/ic_exam_duration.png", "考试时长",
                              info.data.examHours),
                          Container(
                            width: 0.5,
                            height: 120,
                            color: Colors.black12,
                          ),
                          _buildContainer("images/ic_question_num.png", "总题数",
                              info.data.questionNum)
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
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    info.data.examStartTime,
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
                                    info.data.examEndTime,
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
              margin: EdgeInsets.only(top: 600.0, left: 18.0, right: 15.0),
              child: _buildRaisedButton(widget.skipType),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRaisedButton(String type) {
    if (type == "0") {
      return RaisedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  OnlineExamPage(
                    id: widget.id,
                  )));
        },
        child: Text(
          "开始考试",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        padding: EdgeInsets.fromLTRB(130.0, 15.0, 130.0, 15.0),
      );
    } else if (type == "1") {
      return RaisedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  OnlineExamPage(
                    id: widget.id,
                  )));
        },
        child: Text(
          "查看考试结果",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        padding: EdgeInsets.fromLTRB(115.0, 15.0, 115.0, 15.0),
      );
    } else {
      return null;
    }
  }
}
