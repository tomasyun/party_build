import 'package:flutter/material.dart';

class PartyParksPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PartyParksState();
}

class PartyParksState extends State<PartyParksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "党员园地",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
