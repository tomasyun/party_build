import 'package:flutter/material.dart';

class LeaveReasonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LeaveReasonState();
}

class LeaveReasonState extends State<LeaveReasonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "请假事由",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
