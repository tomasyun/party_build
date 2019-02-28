import 'package:flutter/material.dart';
import 'package:party_build/bloc/notice_bloc.dart';
import 'package:party_build/bloc/union_bloc.dart';
import 'package:party_build/list/notice_list.dart';
import 'package:party_build/list/union_list.dart';
import 'package:party_build/model/notice_model.dart';
import 'package:party_build/model/union_model.dart';

class BranchParksPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BranchParksState();
}

class BranchParksState extends State<BranchParksPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  NoticeBloc _noticeBloc = NoticeBloc.newInstance;
  UnionBloc _unionBloc = UnionBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
    _noticeBloc.doGetNoticeRequest(
        title: "",
        type: "3",
        draw: "0",
        start: "0",
        length: "10");
    _controller.addListener(() {
      switch (_controller.index) {
        case 0:
          _noticeBloc.doGetNoticeRequest(
              title: "",
              type: "3",
              draw: "0",
              start: "0",
              length: "10");
          break;
        case 1:
          _unionBloc.doGetUnionRequest(
              articleType: "15",
              childrenType: "32",
              draw: "0",
              start: "0",
              length: "10");
          break;
        case 2:
          _unionBloc.doGetUnionRequest(
              articleType: "15",
              childrenType: "33",
              draw: "0",
              start: "0",
              length: "10");
          break;
        case 3:
          _unionBloc.doGetUnionRequest(
              articleType: "15",
              childrenType: "34",
              draw: "0",
              start: "0",
              length: "10");
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "支部园地",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: "公告通知",
            ),
            Tab(
              text: "支部活动",
            ),
            Tab(
              text: "发展党员",
            ),
            Tab(
              text: "各种台账",
            )
          ],
          labelColor: Colors.white,
          indicatorColor: Colors.red,
          controller: _controller,
        ),
      ),
      body: Center(
        child: TabBarView(
          children: [
            Center(
              child: _buildNoticeList(),
            ),
            Center(
              child: _buildUnionList(),
            ),
            Center(
              child: _buildUnionList(),
            ),
            Center(
              child: _buildUnionList(),
            )
          ],
          controller: _controller,
          physics: NeverScrollableScrollPhysics(), //禁止滑动
        ),
      ),
    );
  }

  Widget _buildNoticeListView(Notice notice) {
    return NoticeList(
      notice: notice,
    );
  }

  Widget _buildUnionListView(Union union) {
    return UnionList(
      data: union.data,
    );
  }

  Widget _buildNoticeList() {
    return _noticeBloc.streamBuild(loading: () {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      );
    }, success: (data) {
      return _buildNoticeListView(data);
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

  Widget _buildUnionList() {
    return _unionBloc.streamBuild(loading: () {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      );
    }, success: (data) {
      return _buildUnionListView(data);
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
}
