import 'package:flutter/material.dart';

class MailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MailState();
}

class MailState extends State<MailPage> {
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
                  onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (BuildContext builder) {
                        return SingleChildScrollView(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    "党委书记",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "纪委书记",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                  child: Container(
                    margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                    padding: EdgeInsets.only(
                        top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "请选择对象",
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
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
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
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
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
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
}
