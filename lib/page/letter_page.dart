import 'package:flutter/material.dart';

class LetterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LetterState();
}

class LetterState extends State<LetterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        "信箱",
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.red,
    ));
  }
}
