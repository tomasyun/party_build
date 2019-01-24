import 'package:flutter/material.dart';
import 'package:party_build/bloc/notice_bloc.dart';
import 'package:party_build/list/notice_list.dart';
import 'package:party_build/model/notice_model.dart';

class NoticePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NoticeState();
}

class NoticeState extends State<NoticePage> {
  NoticeBloc _bloc = NoticeBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetNoticeRequest(type: "1", draw: "0", start: "0", length: "10");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "通知",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: _bloc.streamBuild(
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
            return _buildNoticeListView(data);
          },
          error: (msg) {},
          empty: () {
            return Container(
              child: Center(
                child: Text("暂无数据"),
              ),
            );
          }),
    );
  }

  Widget _buildNoticeListView(Notice notice) {
    return NoticeList(
      notice: notice,
    );
  }
}
