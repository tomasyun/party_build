import 'package:flutter/material.dart';
import 'package:party_build/bloc/online_exam_bloc.dart';
import 'package:party_build/global/toast.dart';
import 'package:party_build/item/exam_question_item.dart';
import 'package:party_build/model/exam_question_model.dart';

// ignore: must_be_immutable
class OnlineExamPage extends StatefulWidget {
  String id;

  OnlineExamPage({this.id});

  @override
  State<StatefulWidget> createState() => OnlineExamState();
}

class OnlineExamState extends State<OnlineExamPage> {
  int _currentPageIndex = 0;
  var _pageController = new PageController(initialPage: 0);
  int groupValue = 1;
  OnlineExamBloc _bloc = OnlineExamBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.getExamQuestionsRequest(widget.id);
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
      if (_currentPageIndex != index) {
        _currentPageIndex = index;
      }
    });
  }

  List<ExamQuestionItem> _buildExamQuestions(Question question) {
    List<ExamQuestionItem> list = List<ExamQuestionItem>();
    for (int i = 0; i < question.data.questionList.length; i++) {
      var item = ExamQuestionItem(
        position: i + 1,
        list: question.data.questionList[i],
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
                            if (index + 1 < _buildExamQuestions(data).length) {
                              _pageController.jumpToPage(index + 1);
                            } else {
                              GlobalToast.showToast("提交成功");
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
              controller: _pageController,
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
}
