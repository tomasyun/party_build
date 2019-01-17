import 'package:flutter/material.dart';

//三会一课
class MeetingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MeetingState();
}

class MeetingState extends State<MeetingPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "三会一课",
          style: TextStyle(color: Colors.white,fontSize: 18.0),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
    );
  }
}
