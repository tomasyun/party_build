import 'package:flutter/material.dart';
import 'package:party_build/item/rank_item.dart';
import 'package:party_build/model/rank_model.dart';

// ignore: must_be_immutable
class RankList extends StatelessWidget {
  Rank rank;

  RankList({this.rank});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildCreditRankList(),
    );
  }

  List<RankItem> _buildCreditRankList() {
    return rank.data.creditInfoList
        .map((item) => RankItem(
              model: item,
            ))
        .toList();
  }
}
