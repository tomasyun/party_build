import 'package:flutter/material.dart';

class CreditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreditState();
}

class CreditState extends State<CreditPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(
            "积分明细",
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
                  height: 150.0,
                  color: Colors.red,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "2500",
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                          padding: EdgeInsets.only(bottom: 10.0),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30.0),
                          child: Text(
                            "全部积分",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                letterSpacing: 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: DefaultTabController(
                      length: 4,
                      initialIndex: 0,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 60.0,
                            child: TabBar(
                              tabs: [
                                Tab(text: '全部'),
                                Tab(text: '本月'),
                                Tab(text: '本周'),
                                Tab(text: '本日')
                              ],
                              indicatorColor: Colors.red,
                              labelColor: Colors.red,
                              unselectedLabelColor: Colors.black45,
                            ),
                          ),
//                          Expanded(child: TabBarView(children: <Widget>[]))
                        ],
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
