import 'package:flutter/material.dart';
import 'package:party_build/bloc/studies_obtain_bloc.dart';
import 'package:party_build/global/toast.dart';
import 'package:party_build/model/response_rst_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: must_be_immutable
class StudiesRslPage extends StatefulWidget {
  String taskId;

  StudiesRslPage({this.taskId});

  @override
  State<StatefulWidget> createState() => StudiesRslState();
}

class StudiesRslState extends State<StudiesRslPage> with StudiesObtainBloc {
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "学习成果",
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15.0, bottom: 300.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  child: TextField(
                    controller: _controller,
                    maxLines: 10,
                    maxLength: 50,
                    cursorColor: Colors.red,
                    cursorWidth: 3.0,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "请填写学习成果",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: RaisedButton(
                    onPressed: () => {_sendObtain()},
                    child: Text(
                      "提交",
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                      maxLines: 1,
                    ),
                    color: Colors.red,
                    padding: EdgeInsets.fromLTRB(135.0, 15.0, 135.0, 15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _sendObtain() {
    if (_controller.text == "") {
      GlobalToast.showToast("请填写成果内容");
    } else {
      doSendObtainRequest(id: widget.taskId, result: _controller.text);
    }
  }

  @override
  void onSuccess(ResponseRstModel model) {
    if (model.code == "0000") {
      _sendObtainSuccess();
    }
  }

  void _sendObtainSuccess() {
    NavigatorState navigator =
        context.rootAncestorStateOfType(const TypeMatcher<NavigatorState>());
    Alert(
        context: context,
        title: "提交成功",
        desc: "恭喜您完成了本次学习任务",
        style: AlertStyle(isCloseButton: false),
        buttons: [
          DialogButton(
              height: 45.0,
              child: Text(
                "确定",
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
              color: Colors.red,
              onPressed: () {
                navigator.pop(context);
              })
        ]).show();
  }
}
