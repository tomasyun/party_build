import 'package:flutter/material.dart';
import 'package:party_build/bloc/exam_rst_info_bloc.dart';
import 'package:party_build/item/ques_chip_item.dart';
import 'package:party_build/model/exam_rst_info_model.dart';

// ignore: must_be_immutable
class ExamRstInfoPage extends StatefulWidget {
  String id;

  ExamRstInfoPage({this.id});

  @override
  State<StatefulWidget> createState() => ExamRstInfoState();
}

class ExamRstInfoState extends State<ExamRstInfoPage> {
  ExamRstInfoBloc _bloc = ExamRstInfoBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetExamRstInfoRequest(ruleId: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "考试结果",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: _buildExamRstBody(),
    );
  }

  Widget _buildExamRstBody() {
    return _bloc.streamBuild(loading: () {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      );
    }, success: (data) {
      return _buildExamRstInfoContent(data);
    }, empty: () {
      return Container(
        child: Center(
          child: Text("暂无数据"),
        ),
      );
    }, error: (msg) {
      return Container(
        child: Center(
          child: Text(msg),
        ),
      );
    });
  }

  Widget _buildExamRstInfoContent(ExamRstInfo info) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: 250.0),
        color: Colors.black12,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                  height: 330.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 20.0),
                            padding: EdgeInsets.all(90.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 225, 201, 0)),
                          ),
                          Container(
                            alignment: AlignmentDirectional.topCenter,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 60.0),
                                  child: Text(
                                    "成绩",
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.white),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    info.data.examScore,
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.white),
                                  ),
                                ),
                                _buildContainer("答题用时:", info.data.examCost,
                                    EdgeInsets.only(top: 130.0)),
                                _buildContainer(
                                    "合格分数:",
                                    info.data.examScore.substring(
                                        info.data.examScore.length - 1,
                                        info.data.examScore.length),
                                    EdgeInsets.only(top: 10.0))
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 180.0),
                  alignment: AlignmentDirectional.topCenter,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: _buildIsPassImage(info.data.isPass),
                      ),
                      Container(
                        alignment: AlignmentDirectional.topCenter,
                        margin: EdgeInsets.only(top: 20.0),
                        child: _buildIsPassText(info.data.isPass),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
              alignment: AlignmentDirectional.topStart,
              child: Wrap(
                spacing: 5.0,
                children: _buildQuesChipList(info.data.questionIds),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<QuesChipItem> _buildQuesChipList(List<ExamRstInfoModel> list) {
    List<QuesChipItem> chipList = List<QuesChipItem>();
    for (int i = 0; i < list.length; i++) {
      var item = QuesChipItem(
        index: (i + 1).toString(),
        model: list[i],
      );
      chipList.add(item);
    }
    return chipList;
  }

  Widget _buildIsPassText(String isPass) {
    if (isPass == "0") {
      return Text(
        "抱歉,考试未通过",
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      );
    } else {
      return Text(
        "恭喜您,考试通过",
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      );
    }
  }

  Widget _buildIsPassImage(String isPass) {
    if (isPass == "0") {
      return Image.asset(
        "images/ic_pass_on.png",
        width: 350,
        height: 80.0,
      );
    } else {
      return Image.asset(
        "images/ic_pass_ok.png",
        width: 350,
        height: 80.0,
      );
    }
  }

  Widget _buildContainer(String title, String value, EdgeInsetsGeometry edg) {
    return Container(
      margin: edg,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              title,
              style: TextStyle(
                  letterSpacing: 1.0, fontSize: 15.0, color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, top: 3.0),
            child: Text(
              value,
              style: TextStyle(
                  letterSpacing: 1.0, fontSize: 15.0, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
