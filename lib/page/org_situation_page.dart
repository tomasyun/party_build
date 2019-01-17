import 'package:flutter/material.dart';

class OrgSituationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OrgSituationState();
}

class OrgSituationState extends State<OrgSituationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "组织机构",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}
