import 'package:flutter/material.dart';

//签到
class SignPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignPageState();
}

class SignPageState extends State<SignPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "签到",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: null,
        backgroundColor: Colors.red,
      ),
    );
  }
}
