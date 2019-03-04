import 'package:flutter/material.dart';

class MeetingSummaryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MeetingSummaryState();
}

class MeetingSummaryState extends State<MeetingSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "会议纪要",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
