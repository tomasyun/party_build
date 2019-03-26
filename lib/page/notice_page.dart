import 'package:flutter/material.dart';
import 'package:party_build/bloc/notice_bloc.dart';
import 'package:party_build/item/notice_item.dart';
import 'package:party_build/model/notice_model.dart';
import 'package:party_build/refresh/behavior.dart';
import 'package:party_build/refresh/header.dart';
import 'package:party_build/refresh/refresher.dart';

class NoticePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NoticeState();
}

class NoticeState extends State<NoticePage> {
  NoticeBloc _bloc = NoticeBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetNoticeRequest(
        title: "", type: "1", draw: "0", start: "0", length: "10");
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
                  children: _buildNoticeListView(data),
                ),
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 1), () {
                    setState(() {
                      _bloc.doGetNoticeRequest(
                          title: "",
                          type: "1",
                          draw: "0",
                          start: "0",
                          length: "10");
                    });
                  });
                },
              ),
            );
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

  List<NoticeItem> _buildNoticeListView(Notice notice) {
    return notice.data
        .map((item) => NoticeItem(
              model: item,
            ))
        .toList();
  }
}
