import 'package:flutter/material.dart';
import 'package:party_build/item/union_item.dart';
import 'package:party_build/model/union_model.dart';

// ignore: must_be_immutable
class UnionList extends StatelessWidget {
  UnionData data;

  UnionList({this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: _buildUnionList(),
    );
  }

  List<UnionItem> _buildUnionList() {
    return data.data
        .map((item) => UnionItem(
              model: item,
            ))
        .toList();
  }
}
