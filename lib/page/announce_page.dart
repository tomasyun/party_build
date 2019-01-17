import 'package:flutter/material.dart';

class AnnouncePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnnounceState();
}

class AnnounceState extends State<AnnouncePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "公告通知",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
