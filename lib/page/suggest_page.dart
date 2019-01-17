import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SuggestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SuggestState();
}

class SuggestState extends State<SuggestPage> {
  _showSubmitSuccessful(BuildContext context) {
    NavigatorState navigator= context.rootAncestorStateOfType(const TypeMatcher<NavigatorState>());
    Alert(
      context: context,
      title: "提交成功",
      desc: "感谢您此次提交的意见，我们会尽快予您回复!",
      type: AlertType.success,
      style: AlertStyle(isCloseButton: false),
      buttons: [
        DialogButton(
          height:45.0 ,
          child: Text(
            "确定",
            style: TextStyle(fontSize: 15.0, color: Colors.white),
          ),
          color: Colors.red,
          onPressed: () =>navigator.pop(context),
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "意见反馈",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                child: TextField(
                  maxLength: 50,
                  maxLines: 10,
                  cursorWidth: 3.0,
                  cursorColor: Colors.red,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  decoration: InputDecoration(
                      hintText: "感谢您使用智慧党建云平台,使用过程中有任何意见请反馈给我们。",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0, bottom: 200.0),
                child: RaisedButton(
                  onPressed: () => _showSubmitSuccessful(context),
                  color: Colors.red,
                  child: Text(
                    "提交反馈",
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  padding: EdgeInsets.only(
                      left: 130.0, right: 130.0, top: 15.0, bottom: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
