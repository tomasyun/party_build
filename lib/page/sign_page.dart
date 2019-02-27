import 'package:flutter/material.dart';

//签到
class SignPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignPageState();
}

class SignPageState extends State<SignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "签到",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: null,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200.0,
                child: Image.network(
                    "http://p1.img.cctvpic.com/photoworkspace/2018/05/18/2018051814175817985.jpg"),
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/ic_clock.png"),
                      width: 16.0,
                      height: 16.0,
                      margin: EdgeInsets.only(top: 3.0),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              "2018年12月11日",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black45),
                            ),
                          ),
                          Container(
                            child: Text(
                              "星期五",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black45),
                            ),
                            padding: EdgeInsets.only(left: 15.0),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              "上午12:00",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black45),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/ic_location.png"),
                      width: 16.0,
                      height: 16.0,
                      margin: EdgeInsets.only(top: 3.0),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: Text(
                          "陕西省西安市高新区丈八北路汇鑫IBC 1501室",
                          style: TextStyle(fontSize: 15.0, color: Colors.red),
                          maxLines: 2,
                        ),
                      ),
                      flex: 1,
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(50.0),
                  margin: EdgeInsets.only(top: 60.0),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                  child: Text(
                    "会议签到",
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
