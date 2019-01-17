import 'package:flutter/material.dart';

class GardenParksPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GardenParksState();
}

class GardenParksState extends State<GardenParksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "团员园地",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
