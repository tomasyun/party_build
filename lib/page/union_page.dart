import 'package:flutter/material.dart';

class UnionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UnionState();
}

class UnionState extends State<UnionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "工会工作",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
