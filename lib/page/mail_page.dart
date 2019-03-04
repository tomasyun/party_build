import 'package:flutter/material.dart';
import 'package:party_build/bloc/mail_bloc.dart';
import 'package:party_build/item/leaders_item.dart';
import 'package:party_build/model/leaders_model.dart';

class MailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MailState();
}

class MailState extends State<MailPage> with MailBloc {
  String position = "请选择对象";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "领导信箱",
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
                GestureDetector(
                  onTap: doGetLeaders,
                  child: Container(
                    margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                    padding: EdgeInsets.only(
                        top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          position,
                          style: TextStyle(fontSize: 14.0, color: Colors.black),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              )
                            ],
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0),
                  child: TextField(
                    maxLines: 10,
                    maxLength: 50,
                    cursorColor: Colors.red,
                    cursorWidth: 3.0,
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: "请在此输入您要反馈的内容,感谢您使用智慧党建云平台。",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0, bottom: 100.0),
                  child: RaisedButton(
                    onPressed: () => {},
                    child: Text(
                      "提交反馈",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    color: Colors.red,
                    padding: EdgeInsets.fromLTRB(130.0, 15.0, 130.0, 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  void onSuccess(Leaders leaders) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: _buildLeadersList(leaders),
              ),
            ),
          );
        });
  }

//集合
  List<LeadersItem> _buildLeadersList(Leaders leaders) {
    return leaders.data
        .map((item) => LeadersItem(
              data: item,
              onPress: (item) {
                setState(() {
                  position = item.position;
                });
              },
            ))
        .toList();
  }
}
