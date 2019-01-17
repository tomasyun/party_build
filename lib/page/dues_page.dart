import 'package:flutter/material.dart';

class DuesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DuesState();
}

class DuesState extends State<DuesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "党费缴纳",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
