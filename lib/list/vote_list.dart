import 'package:flutter/material.dart';
import 'package:party_build/item/vote_item.dart';
import 'package:party_build/model/vote_model.dart';

// ignore: must_be_immutable
class VoteList extends StatelessWidget {
  Vote vote;

  VoteList({this.vote});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildVoteListView(),
    );
  }

  List<VoteItem> _buildVoteListView() {
    return vote.data
        .map((item) => VoteItem(
              model: item,
            ))
        .toList();
  }
}
