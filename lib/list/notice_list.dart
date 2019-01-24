import 'package:flutter/material.dart';
import 'package:party_build/item/notice_item.dart';
import 'package:party_build/model/notice_model.dart';

// ignore: must_be_immutable
class NoticeList extends StatelessWidget {
  Notice notice;

  NoticeList({this.notice});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildNoticeList(),
    );
  }

  List<NoticeItem> _buildNoticeList() {
    return notice.data
        .map((item) => NoticeItem(
              model: item,
            ))
        .toList();
  }
}
