import 'package:flutter/material.dart';
import 'package:party_build/model/credit_model.dart';

// ignore: must_be_immutable
class CreditItem extends StatelessWidget {
  CreditData data;

  CreditItem({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          data.title,
                          style: TextStyle(fontSize: 14.0, color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Text(
                          data.auditDate,
                          style:
                          TextStyle(fontSize: 14.0, color: Colors.black45),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      "+" + data.score,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 0.5,
            color: Colors.black12,
          )
        ],
      ),
    );
  }
}
