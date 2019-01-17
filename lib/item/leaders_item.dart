import 'package:flutter/material.dart';
import 'package:party_build/model/leaders_model.dart';

// ignore: must_be_immutable
class LeadersItem extends StatelessWidget {
  LeaderData data;

  LeadersItem({this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Center(
            child: Text(
              data.position,
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 0.5,
          color: Colors.black12,
        )
      ],
    ));
  }
}
