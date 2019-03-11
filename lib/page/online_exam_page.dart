import 'package:flutter/material.dart';
import 'package:party_build/bloc/online_exam_bloc.dart';
import 'package:party_build/bloc/save_exam_answer_bloc.dart';
import 'package:party_build/global/rxbus.dart';
import 'package:party_build/global/toast.dart';
import 'package:party_build/item/exam_ques_item.dart';
import 'package:party_build/model/exam_question_model.dart';
import 'package:party_build/model/exam_rst_model.dart';
import 'package:party_build/model/exam_sub_model.dart';
import 'package:party_build/page/exam_rst_info_page.dart';

// ignore: must_be_immutable
class OnlineExamPage extends StatefulWidget {
  String id;
  String score;
  String cost;
  String time;

  OnlineExamPage({this.id, this.score, this.cost, this.time});

  @override
  State<StatefulWidget> createState() => OnlineExamState();
}

class OnlineExamState extends State<OnlineExamPage> with SaveExamAnswerBloc {
  int _curIndex = 0;
  var _controller = new PageController(initialPage: 0);
  int group = 1;

  List<ExamSubModel> _models;
  OnlineExamBloc _bloc = OnlineExamBloc.newInstance;
  ExamSubModel _model;
  bool _isSelect = false;

  @override
  void initState() {
    super.initState();
    _models = List<ExamSubModel>();
    _bloc.getExamQuestionsRequest(widget.id);
    RxBus.register<ExamSubModel>(tag: "单选题").listen((event) {
      _model = event;
      _isSelect = true;
    });
    RxBus.register<ExamSubModel>(tag: "多选题").listen((event) {
      _model = event;
      _isSelect = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "在线考试",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: _buildExamQuestion(),
    );
  }

  void _pageChanged(int index) {
    setState(() {
      if (_curIndex != index) {
        _curIndex = index;
      }
    });
  }

  List<ExamQuesItem> _buildExamQuestions(Question question) {
    List<ExamQuesItem> list = List<ExamQuesItem>();
    for (int i = 0; i < question.data.questionList.length; i++) {
      var item = ExamQuesItem(
        pos: i + 1,
        questions: question.data.questionList[i],
      );
      list.add(item);
    }
    return list;
  }

  Widget _buildExamQuestion() {
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
          return Container(
            child: PageView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: _buildExamQuestions(data)[index],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40.0),
                        child: RaisedButton(
                          onPressed: () {
                            if (_isSelect) {
                              _isSelect = false;
                              _models.add(_model);
                              if (index + 1 <
                                  _buildExamQuestions(data).length) {
                                _controller.jumpToPage(index + 1);
                              } else {
                                ExamSubData data = ExamSubData.fromParams(
                                    examCost: widget.cost,
                                    examRuleId: widget.id,
                                    examTime: widget.time);
                                ExamSub sub = ExamSub.fromParams(
                                    limitScore: widget.score,
                                    testAnswers: _models,
                                    examRecord: data);
                                doSaveExamAnswerRequest(json: sub.toString());
                              }
                            } else {
                              GlobalToast.showToast("请选择");
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          color: Colors.red,
                          child: _buildText(
                              index + 1, _buildExamQuestions(data).length),
                          padding: EdgeInsets.only(
                              left: 145.0,
                              right: 145.0,
                              top: 15.0,
                              bottom: 15.0),
                        ),
                      )
                    ],
                  ),
                );
              },
              controller: _controller,
              onPageChanged: _pageChanged,
              itemCount: _buildExamQuestions(data).length,
              physics: NeverScrollableScrollPhysics(),
            ),
          );
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

  Widget _buildText(int indexStart, int indexEnd) {
    if (indexStart < indexEnd) {
      return Text(
        "下一题",
        style: TextStyle(fontSize: 14.0, color: Colors.white),
      );
    } else {
      return Text(
        "提交",
        style: TextStyle(fontSize: 14.0, color: Colors.white),
      );
    }
  }

  @override
  void onSuccess(ExamRst model) {
    if (model.code == "0000") {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => ExamRstInfoPage(
                    id: widget.id,
                  )),
          (route) => route == null);
    }
  }
}
