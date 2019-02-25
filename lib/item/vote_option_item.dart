import 'package:flutter/material.dart';
import 'package:party_build/model/vote_info_model.dart';

// ignore: must_be_immutable
class VoteOptionItem extends StatefulWidget {
  int value;
  int groupValue;
  VoteInfoModel model;

  VoteOptionItem({this.value, this.model});

  @override
  State<StatefulWidget> createState() {
    return null;
  }
}

class VoteOptionState extends State<VoteOptionItem> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        value: widget.value,
        groupValue: widget.groupValue,
        onChanged: (T) {
          updateChanged(T);
        });
  }

  void updateChanged(int value) {
    setState(() {
      widget.groupValue = value;
    });
  }
}
