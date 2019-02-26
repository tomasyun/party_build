import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoticeInfoPage extends StatefulWidget {
  String id;

  NoticeInfoPage({this.id});

  @override
  State<StatefulWidget> createState() => NoticeInfoState();
}

class NoticeInfoState extends State<NoticeInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "通知详情",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
