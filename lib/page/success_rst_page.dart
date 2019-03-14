import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SuccessRstPage extends StatefulWidget {
  String skipId;

  String meetingId;

  SuccessRstPage({this.skipId, this.meetingId});

  @override
  State<StatefulWidget> createState() => SuccessRstState();
}

class SuccessRstState extends State<SuccessRstPage> {
  String title;
  String decs;
  String prompt;

  @override
  void initState() {
    super.initState();
    switch (widget.skipId) {
      case "0": //"三会一课"报名成功
        title = "报名成功";
        decs = "恭喜您!报名成功";
        prompt = "注意开会时间和地点,千万不要迟到";
        break;
      case "1": //"组织活动"报名成功（暂不实现）
        title = "报名成功";
        decs = "恭喜您!报名成功";
        prompt = "注意活动时间和地点,千万不要迟到";
        break;
      case "2": //请假成功
        title = "请假成功";
        decs = "成功提交请假条";
        prompt = "下次请尽量参加会议";
        break;
      case "3":
        title = "投票成功";
        decs = "投票成功!";
        prompt = "感谢您的参与";
        break;
      case "4":
        title = "提交成功";
        decs = "提交成功!";
        prompt = "感谢您的宝贵时间";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 120.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset(
                  "images/ic_success.png",
                  width: 100,
                  height: 100,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0),
                child: Text(
                  decs,
                  style: TextStyle(fontSize: 16.0, color: Colors.red),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Text(
                  prompt,
                  style: TextStyle(fontSize: 16.0, color: Colors.red),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0),
                child: RaisedButton(
                  onPressed: () {
                    onFinish();
                  },
                  child: Text(
                    "完成",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  color: Colors.red,
                  padding: EdgeInsets.only(
                      left: 100.0, right: 100.0, top: 15.0, bottom: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onFinish() {
    if (widget.skipId == "0") { //报名
      Navigator.of(context).pop("0");
    } else if (widget.skipId == "1") {
      //暂时不实现
    } else if (widget.skipId == "2") { //请假
    } else if (widget.skipId == "3") { //投票
    } else if (widget.skipId == "4") { //问卷

    }
  }
}
