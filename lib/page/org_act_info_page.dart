import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrgActInfoPage extends StatefulWidget {
  String id;

  OrgActInfoPage({this.id});

  @override
  State<StatefulWidget> createState() => OrgActInfoState();
}

class OrgActInfoState extends State<OrgActInfoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "活动摘要",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
