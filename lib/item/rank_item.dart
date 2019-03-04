import 'package:flutter/material.dart';
import 'package:party_build/model/rank_model.dart';

// ignore: must_be_immutable
class RankItem extends StatefulWidget {
  RankModel model;
  String userId;

  RankItem({this.model, this.userId});

  @override
  State<StatefulWidget> createState() => RankItemState();
}

class RankItemState extends State<RankItem> {
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
                _buildRankText(widget.model.rank),
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Image.asset(
                    "images/ic_avatar.png",
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
                _buildNameText(widget.model.name),
                Expanded(
                  child: _buildScoreText(widget.model.score),
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

  Widget _buildRankText(String rank) {
    if (widget.userId == widget.model.id) {
      return Container(
        child: Text(
          rank,
          style: TextStyle(
              fontSize: 14.0, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return Container(
        child: Text(
          rank,
          style: TextStyle(fontSize: 14.0, color: Colors.black45),
        ),
      );
    }
  }

  Widget _buildNameText(String name) {
    if (widget.userId == widget.model.id) {
      return Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Text(
          name,
          style: TextStyle(
              fontSize: 14.0, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Text(
          name,
          style: TextStyle(fontSize: 14.0, color: Colors.black45),
        ),
      );
    }
  }

  Widget _buildScoreText(String score) {
    if (widget.userId == widget.model.id) {
      return Container(
        child: Text(
          score + "分",
          textAlign: TextAlign.right,
          style: TextStyle(
              fontSize: 14.0, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return Container(
        child: Text(
          score + "分",
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 14.0, color: Colors.black45),
        ),
      );
    }
  }
}
