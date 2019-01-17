import 'package:flutter/material.dart';

class OrgActPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OrgActState();
}

class OrgActState extends State<OrgActPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "组织活动",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
