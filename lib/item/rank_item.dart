import 'package:flutter/material.dart';
import 'package:party_build/model/rank_model.dart';

// ignore: must_be_immutable
class RankItem extends StatelessWidget {
  RankModel model;

  RankItem({this.model});

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
                  child: Text(
                    model.rank,
                    style: TextStyle(fontSize: 15.0, color: Colors.black45),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Image.asset(
                    "images/ic_avatar.png",
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Text(
                    model.name,
                    style: TextStyle(fontSize: 15.0, color: Colors.black45),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      model.score + "分",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 15.0, color: Colors.black45),
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
