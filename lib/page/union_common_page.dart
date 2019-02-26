import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UnionCommonPage extends StatefulWidget {
  int skipType;
  String pageTitle;

  UnionCommonPage({this.skipType, this.pageTitle});

  @override
  State<StatefulWidget> createState() => UnionCommonState();
}

class UnionCommonState extends State<UnionCommonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pageTitle,
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
