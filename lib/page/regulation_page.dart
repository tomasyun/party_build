import 'package:flutter/material.dart';

class RegulationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegulationState();
}

class RegulationState extends State<RegulationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "规章制度",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
