import 'package:flutter/material.dart';

class StudiesRslPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StudiesRslState();
}

class StudiesRslState extends State<StudiesRslPage> {
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
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
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
                    onPressed: () => {},
                    child: Text(
                      "提交",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
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
}
