import 'package:flutter/material.dart';
import 'package:party_build/bloc/notice_bloc.dart';
import 'package:party_build/item/notice_item.dart';
import 'package:party_build/model/notice_model.dart';
import 'package:party_build/refresh/behavior.dart';
import 'package:party_build/refresh/header.dart';
import 'package:party_build/refresh/refresher.dart';

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
        title: "", type: "2", draw: "0", start: "0", length: "10");
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

  List<NoticeItem> _buildAnnounceListView(Notice notice) {
    return notice.data
        .map((item) => NoticeItem(
              model: item,
            ))
        .toList();
  }

  Widget _buildStateView(Notice notice) {
    if (notice.code == "0000") {
      if (notice.data != null && notice.data.isNotEmpty) {
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
              children: _buildAnnounceListView(notice),
            ),
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1), () {
                setState(() {
                  _bloc.doGetNoticeRequest(
                      title: "",
                      type: "2",
                      draw: "0",
                      start: "0",
                      length: "10");
                });
              });
            },
          ),
        );
      } else {
        return Container(
          child: Center(
            child: Text("暂无数据"),
          ),
        );
      }
    } else {
      return Container(
        width: 0.0,
        height: 0.0,
      );
    }
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
      return _buildStateView(data);
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
