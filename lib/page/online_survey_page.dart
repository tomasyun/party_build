import 'package:flutter/material.dart';
import 'package:party_build/bloc/save_survey_answer_bloc.dart';
import 'package:party_build/bloc/survey_question_bloc.dart';
import 'package:party_build/global/rxbus.dart';
import 'package:party_build/global/toast.dart';
import 'package:party_build/item/survey_question_item.dart';
import 'package:party_build/model/response_rst_model.dart';
import 'package:party_build/model/survey_answer_model.dart';
import 'package:party_build/model/survey_question_model.dart';
import 'package:party_build/page/success_rst_page.dart';

// ignore: must_be_immutable
class OnlineSurveyPage extends StatefulWidget {
  String surveyId;

  OnlineSurveyPage({this.surveyId});

  @override
  State<StatefulWidget> createState() => OnlineSurveyState();
}

class OnlineSurveyState extends State<OnlineSurveyPage>
    with SaveSurveyAnswerBloc {
  int _currentPageIndex = 0;
  var _pageController = new PageController(initialPage: 0);
  int groupValue = 1;
  SurveyQuestionBloc _bloc = SurveyQuestionBloc.newInstance;

  List<AnswerModel> _models;
  AnswerModel _model;
  bool _isSelect = false;

  @override
  void initState() {
    super.initState();
    _models = List<AnswerModel>();
    _bloc.doGetSurveyQuestionRequest(surveyId: widget.surveyId);

    RxBus.register<AnswerModel>(tag: "1").listen((event) {
      _model = event;
      _isSelect = true;
    });
    RxBus.register<AnswerModel>(tag: "2").listen((event) {
      _model = event;
      _isSelect = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "调查问卷",
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

  List<SurveyQuestionItem> _buildSurveyQuestions(SurveyQuestion question) {
    List<SurveyQuestionItem> list = List<SurveyQuestionItem>();
    for (int i = 0; i < question.data.length; i++) {
      var item = SurveyQuestionItem(
        position: i + 1,
        questionData: question.data[i],
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
          return _buildOnlineSurveyContent(data);
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

  Widget _buildOnlineSurveyContent(SurveyQuestion question) {
    return Container(
      child: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: _buildSurveyQuestions(question)[index],
                ),
                Container(
                  margin: EdgeInsets.only(top: 40.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_isSelect) {
                        _isSelect = false;
                        _models.add(_model);
                        print(_models.toString());
                        if (index + 1 <
                            _buildSurveyQuestions(question).length) {
                          _pageController.jumpToPage(index + 1);
                        } else {
                          SurveyAnswerRes answerRes =
                              SurveyAnswerRes.fromParams(
                                  id: widget.surveyId, answers: _models);
                          doSaveSurveyAnswerRequest(json: answerRes.toString());
                        }
                      } else {
                        GlobalToast.showToast("请选择");
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    color: Colors.red,
                    child: _buildText(
                        index + 1, _buildSurveyQuestions(question).length),
                    padding: EdgeInsets.only(
                        left: 145.0, right: 145.0, top: 15.0, bottom: 15.0),
                  ),
                )
              ],
            ),
          );
        },
        controller: _pageController,
        onPageChanged: _pageChanged,
        itemCount: _buildSurveyQuestions(question).length,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
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
  void onSuccess(ResponseRstModel model) {
    if (model.code == "0000") {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => SuccessRstPage(
                    skipId: "4",
                  )),
          (route) => route == null);
    }
  }
}
