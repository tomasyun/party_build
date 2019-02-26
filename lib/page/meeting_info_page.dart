import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MeetingInfoPage extends StatefulWidget {
  String id;

  MeetingInfoPage({this.id});

  @override
  State<StatefulWidget> createState() => MeetingInfoState();
}

class MeetingInfoState extends State<MeetingInfoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "会议摘要",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
