import 'package:flutter/material.dart';
import 'package:party_build/model/leaders_model.dart';

typedef void OnPress(LeaderData data);

// ignore: must_be_immutable
class LeadersItem extends StatelessWidget {
  LeaderData data;
  OnPress onPress;

  LeadersItem({this.data, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            onPress(data);
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Center(
              child: Text(
                data.position,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 0.5,
          color: Colors.black12,
        )
      ],
    );
  }
}
