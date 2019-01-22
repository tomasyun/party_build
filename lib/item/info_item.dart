import 'package:flutter/material.dart';
import 'package:party_build/model/info_model.dart';

// ignore: must_be_immutable
class InfoItem extends StatelessWidget {
  InfoModel model;

  InfoItem({this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    model.title,
                    style: TextStyle(color: Colors.black, fontSize: 15.0,fontWeight: FontWeight.normal),
                    maxLines: 2,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          model.publishDate,
                          style:
                              TextStyle(color: Colors.black45, fontSize: 13.0),
                          maxLines: 1,
                        ),
                        padding: EdgeInsets.only(top: 3.0),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Text(
                          model.commentNum + "数",
                          style:
                              TextStyle(color: Colors.black45, fontSize: 13.0),
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                ),
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
