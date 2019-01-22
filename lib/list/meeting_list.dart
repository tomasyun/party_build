import 'package:flutter/material.dart';
import 'package:party_build/item/meeting_item.dart';
import 'package:party_build/model/meeting_model.dart';

// ignore: must_be_immutable
class MeetingList extends StatelessWidget {
  Meeting meeting;

  MeetingList({this.meeting});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildMeetingList(),
    );
  }

  List<MeetingItem> _buildMeetingList() {
    return meeting.data
        .map((item) => MeetingItem(
              data: item,
            ))
        .toList();
  }
}
