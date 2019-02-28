import 'package:flutter/material.dart';
import 'package:party_build/bloc/notice_bloc.dart';
import 'package:party_build/list/notice_list.dart';
import 'package:party_build/model/notice_model.dart';

class AnnouncePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnnounceState();
}

class AnnounceState extends State<AnnouncePage> {
  NoticeBloc _bloc = NoticeBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetNoticeRequest(
        title: "",
        type: "2",
        draw: "0",
        start: "0",
        length: "10");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "公告通知",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: _buildAnnounceList(),
    );
  }

  Widget _buildAnnounceListView(Notice notice) {
    return NoticeList(
      notice: notice,
    );
  }

  Widget _buildAnnounceList() {
    return _bloc.streamBuild(loading: () {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      );
    }, success: (data) {
      return _buildAnnounceListView(data);
    }, error: (msg) {
      return Container(
        child: Center(
          child: Text(msg),
        ),
      );
    }, empty: () {
      return Container(
        child: Center(
          child: Text("暂无数据"),
        ),
      );
    });
  }
}
