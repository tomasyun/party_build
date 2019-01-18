import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:party_build/item/talk_item.dart';
import 'package:party_build/model/info_model.dart';

class TalkListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TalkListState();
}

class TalkListState extends State<TalkListView> {
  InfoData _data;

  Future<void> _onRefresh() {
    return null;
  }
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: _onRefresh,
      child: ListView(
        children: _buildTalkList(),
      ),
    );
  }

//习总讲话列表
  List<TalkItem> _buildTalkList() {
    return _data.data
        .map((item) => TalkItem(
              model: item,
            ))
        .toList();
  }
}
