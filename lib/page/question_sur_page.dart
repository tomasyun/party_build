import 'package:flutter/material.dart';

class QuestionSurPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QuestionSurState();
}

class QuestionSurState extends State<QuestionSurPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "问卷调查",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
