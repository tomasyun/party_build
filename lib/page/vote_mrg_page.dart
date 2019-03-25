import 'package:flutter/material.dart';
import 'package:party_build/bloc/vote_bloc.dart';
import 'package:party_build/item/vote_item.dart';
import 'package:party_build/model/vote_model.dart';
import 'package:party_build/refresh/behavior.dart';
import 'package:party_build/refresh/header.dart';
import 'package:party_build/refresh/refresher.dart';

class VoteMrgPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VoteMrgState();
}

class VoteMrgState extends State<VoteMrgPage> {
  VoteBloc _bloc = VoteBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetVoteListRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "投票管理",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: _buildVoteList(),
      ),
    );
  }

  List<VoteItem> _buildVoteListView(Vote vote) {
    return vote.data
        .map((item) => VoteItem(
              model: item,
            ))
        .toList();
  }

  Widget _buildVoteList() {
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
                children: _buildVoteListView(data),
              ),
              onRefresh: () async {
                await new Future.delayed(const Duration(seconds: 1), () {
                  setState(() {
                    _bloc.doGetVoteListRequest();
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
        });
  }
}
