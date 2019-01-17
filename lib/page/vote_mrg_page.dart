import 'package:flutter/material.dart';

class VoteMrgPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VoteMrgState();
}

class VoteMrgState extends State<VoteMrgPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "投票管理",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
