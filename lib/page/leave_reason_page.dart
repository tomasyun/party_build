import 'package:flutter/material.dart';
import 'package:party_build/bloc/leave_reason_bloc.dart';
import 'package:party_build/global/toast.dart';
import 'package:party_build/model/response_rst_model.dart';
import 'package:party_build/page/success_rst_page.dart';

// ignore: must_be_immutable
class LeaveReasonPage extends StatefulWidget {
  String meetingId;

  LeaveReasonPage({this.meetingId});

  @override
  State<StatefulWidget> createState() => LeaveReasonState();
}

class LeaveReasonState extends State<LeaveReasonPage> with LeaveReasonBloc {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "请假事由",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0),
                child: TextField(
                  controller: _controller,
                  maxLines: 10,
                  maxLength: 50,
                  cursorColor: Colors.red,
                  cursorWidth: 3.0,
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                  decoration: InputDecoration(
                      hintText: "因出差未归，不能按时参会",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0)))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0),
                child: RaisedButton(
                  onPressed: () {
                    _submitLeaveReason();
                  },
                  child: Text(
                    "提交",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  color: Colors.red,
                  padding: EdgeInsets.only(
                      left: 150.0, right: 150.0, top: 15.0, bottom: 15.0),
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

  void _submitLeaveReason() {
    if (_controller.text.isEmpty) {
      GlobalToast.showToast("请填写请假原因");
    } else {
      doLeaveReasonRequest(id: widget.meetingId, reason: _controller.text);
    }
  }

  @override
  void onSuccess(ResponseRstModel model) {
    if (model.code == "0000") {
//      GlobalToast.showToast(model.msg);
//      Navigator.of(context).pop("pop");
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => SuccessRstPage(
                  skipId: "2",
                )),
      );
      setState(() {
        _controller.text = "";
      });
    }
  }
}
