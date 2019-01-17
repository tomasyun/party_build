import 'package:flutter/material.dart';

class TrainingParksPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TrainingParksState();
}

class TrainingParksState extends State<TrainingParksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "培训园地",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
