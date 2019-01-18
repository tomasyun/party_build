import 'package:flutter/material.dart';
import 'package:party_build/item/talk_item.dart';
import 'package:party_build/model/info_model.dart';

// ignore: must_be_immutable
class TalkListView extends StatefulWidget {
  InfoData data;

  TalkListView({this.data});

  @override
  State<StatefulWidget> createState() => TalkListState();
}

class TalkListState extends State<TalkListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildTalkList(),
    );
  }

//习总讲话列表
  List<TalkItem> _buildTalkList() {
    return widget.data.data
        .map((item) => TalkItem(
              model: item,
            ))
        .toList();
  }
}
