import 'package:flutter/material.dart';
import 'package:party_build/bloc/exam_bloc.dart';
import 'package:party_build/item/exam_ok_item.dart';
import 'package:party_build/item/exam_on_item.dart';
import 'package:party_build/model/exam_model.dart';
import 'package:party_build/refresh/behavior.dart';
import 'package:party_build/refresh/header.dart';
import 'package:party_build/refresh/refresher.dart';

//考试
class ExamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExamPageState();
}

class ExamPageState extends State<ExamPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  ExamBloc _bloc = ExamBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetExam(type: "0");
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
    _controller.addListener(() {
      if (_controller.indexIsChanging)
        _bloc.doGetExam(type: _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "考试",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: null,
        backgroundColor: Colors.red,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: "待考",
            ),
            Tab(
              text: "已考",
            )
          ],
          controller: _controller,
          indicatorColor: Colors.red,
          labelColor: Colors.white,
          labelStyle: TextStyle(letterSpacing: 5.0),
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          _buildExamList("0"),
          _buildExamList("1"),
        ],
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

//已考列表
  Widget _buildList(String type, ExamModel model) {
    return Center(
      child: EasyRefresh(
        key: GlobalKey<EasyRefreshState>(),
        behavior: ScrollOverBehavior(),
        refreshHeader: ClassicsHeader(
          key: GlobalKey<RefreshHeaderState>(),
          bgColor: Colors.transparent,
          textColor: Colors.black87,
          moreInfoColor: Colors.black54,
          showMore: true,
        ),
        child: ListView(
          children: _buildExamListView(type, model),
        ),
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _bloc.doGetExam(type: _controller.index.toString());
            });
          });
        },
      ),
    );
  }

  List<Widget> _buildExamListView(String type, ExamModel model) {
    if (type == "0") {
      return model.data
          .map((item) => ExamOnItem(
                exam: item,
              ))
          .toList();
    } else if (type == "1") {
      return model.data
          .map((item) => ExamOkItem(
                exam: item,
              ))
          .toList();
    } else {
      return [];
    }
  }

  Widget _buildExamList(String type) {
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
          return _buildList(type, data);
        },
        error: (msg) {},
        empty: () {
          return Container(
            child: Center(
              child: Text("暂无数据"),
            ),
          );
        });
  }
}
