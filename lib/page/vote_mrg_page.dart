import 'package:flutter/material.dart';
import 'package:party_build/bloc/vote_bloc.dart';
import 'package:party_build/list/vote_list.dart';
import 'package:party_build/model/vote_model.dart';

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

  Widget _buildVoteListView(Vote vote) {
    return VoteList(
      vote: vote,
    );
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
          return _buildVoteListView(data);
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
