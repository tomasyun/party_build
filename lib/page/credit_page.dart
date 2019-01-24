import 'package:flutter/material.dart';

class CreditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreditState();
}

class CreditState extends State<CreditPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List<Center> tabList;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "积分明细",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        bottom: PreferredSize(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "2500",
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
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
                    child: Column(
                      children: <Widget>[
                        Container(
                          color: Colors.red,
                          height: 70.0,
                          child: TabBar(
                            tabs: [
                              Tab(text: '全部'),
                              Tab(text: '本月'),
                              Tab(text: '本周'),
                              Tab(text: '本日')
                            ],
                            controller: _controller,
                            labelColor: Colors.white,
                            indicatorColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            preferredSize: Size(double.infinity, 200)),
      ),
      body: TabBarView(
        children: <Widget>[
          Center(
            child: Text("全部"),
          ),
          Center(
            child: Text("本月"),
          ),
          Center(
            child: Text("本周"),
          ),
          Center(
            child: Text("本日"),
          ),
        ],
        controller: _controller,
      ),
    );
  }
}
