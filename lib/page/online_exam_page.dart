import 'package:flutter/material.dart';
import 'package:party_build/bloc/online_exam_bloc.dart';
import 'package:party_build/global/toast.dart';

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
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: <Widget>[
                _buildOptionsContainer(),
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                  child: RaisedButton(
                    onPressed: () {
                      GlobalToast.showToast(_currentPageIndex.toString());
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    color: Colors.red,
                    child: Text(
                      "下一题",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    padding: EdgeInsets.only(
                        left: 130.0, right: 130.0, top: 15.0, bottom: 15.0),
                  ),
                )
              ],
            ),
          );
        },
        controller: _pageController,
        onPageChanged: _pageChanged,
        itemCount: 1,
      ),
    );
  }

  void _pageChanged(int index) {
    setState(() {
      if (_currentPageIndex != index) {
        _currentPageIndex = index;
      }
    });
  }

  Widget _buildOptionsContainer() {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Column(
        children: <Widget>[
          RadioListTile(
            value: 0,
            groupValue: groupValue,
            onChanged: updateGroupValue,
            title: Text(
              "小红",
              style: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          ),
          RadioListTile(
            value: 1,
            groupValue: groupValue,
            onChanged: updateGroupValue,
            title: Text(
              "小明",
              style: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          ),
          RadioListTile(
            value: 2,
            groupValue: groupValue,
            onChanged: updateGroupValue,
            title: Text(
              "小李",
              style: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  void updateGroupValue(int value) {
    setState(() {
      groupValue = value;
      GlobalToast.showToast(value.toString());
    });
  }
}
