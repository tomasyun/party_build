import 'package:flutter/material.dart';
import 'package:party_build/item/info_item.dart';
import 'package:party_build/model/info_model.dart';

// ignore: must_be_immutable
class InfoList extends StatefulWidget {
  InfoData data;

  InfoList({this.data});

  @override
  State<StatefulWidget> createState() => TalkListState();
}

class TalkListState extends State<InfoList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildTalkList(),
    );
  }

//习总讲话列表
  List<InfoItem> _buildTalkList() {
    return widget.data.data
        .map((item) => InfoItem(
              model: item,
            ))
        .toList();
  }
}
