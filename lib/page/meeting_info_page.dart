import 'package:flutter/material.dart';
import 'package:party_build/global/toast.dart';

// ignore: must_be_immutable
class MeetingInfoPage extends StatefulWidget {
  String id;

  MeetingInfoPage({this.id});

  @override
  State<StatefulWidget> createState() => MeetingInfoState();
}

class MeetingInfoState extends State<MeetingInfoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "会议摘要",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Container(

              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 80.0,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.black12,
                ),
                Container(
                  height: 79.0,
                  alignment: AlignmentDirectional.center,
                  child: RaisedButton(
                    onPressed: () {
                      GlobalToast.showToast("查看会议纪要");
                    },
                    child: Text(
                      "查看会议纪要",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    padding: EdgeInsets.only(
                        left: 120.0, top: 15.0, bottom: 15.0, right: 120.0),
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      backgroundColor: Color.fromARGB(225, 245, 245, 245),
    );
  }
}
