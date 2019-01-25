import 'package:flutter/material.dart';
import 'package:party_build/item/org_act_item.dart';
import 'package:party_build/model/org_act_model.dart';

// ignore: must_be_immutable
class OrgActList extends StatelessWidget {
  OrgAct orgAct;

  OrgActList({this.orgAct});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildOrgActList(),
    );
  }

  List<OrgActItem> _buildOrgActList() {
    return orgAct.data
        .map((item) => OrgActItem(
              model: item,
            ))
        .toList();
  }
}
