import 'package:flutter/material.dart';
import 'package:party_build/model/org_act_model.dart';

// ignore: must_be_immutable
class OrgActItem extends StatelessWidget {
  OrgActModel model;

  OrgActItem({this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      _buildMeetingStateContainer(model.state),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: Text(
                            model.title,
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0),
                            maxLines: 1,
                          ),
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          model.limitDate,
                          style:
                              TextStyle(color: Colors.black45, fontSize: 13.0),
                        ),
                        padding: EdgeInsets.only(top: 3.0),
                      ),
                      _buildMeetingDateDesc(model.state),
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

Widget _buildMeetingStateContainer(String state) {
  if (state == "0") {
    return Container(
      child: Text(
        "未开始",
        style: TextStyle(color: Colors.white, fontSize: 14.0),
      ),
      color: Colors.red,
      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 2.0, bottom: 2.0),
    );
  } else if (state == "1") {
    return Container(
      child: Text(
        "进行中",
        style: TextStyle(color: Colors.red, fontSize: 14.0),
      ),
      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 2.0, bottom: 2.0),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  } else if (state == "2") {
    return Container(
      child: Text(
        "已结束",
        style: TextStyle(color: Colors.white, fontSize: 14.0),
      ),
      color: Colors.black45,
      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 2.0, bottom: 2.0),
    );
  } else {
    return null;
  }
}

Widget _buildMeetingDateDesc(String state) {
  if (state == "0") {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      child: Text(
        "截止报名",
        style: TextStyle(color: Colors.black45, fontSize: 13.0),
      ),
    );
  } else if (state == "1") {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      child: Text(
        "截止报名",
        style: TextStyle(color: Colors.black45, fontSize: 13.0),
      ),
    );
  } else if (state == "2") {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      child: Text(
        "结束日期",
        style: TextStyle(color: Colors.black45, fontSize: 13.0),
      ),
    );
  } else {
    return null;
  }
}
