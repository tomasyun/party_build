import 'package:flutter/material.dart';

class CollectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CollectState();
}

class CollectState extends State<CollectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "收藏",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
