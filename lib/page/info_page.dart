import 'package:flutter/material.dart';

//资讯
class InfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

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
          "资讯",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: null,
        backgroundColor: Colors.red,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: "习总讲话",
            ),
            Tab(
              text: "时政要闻",
            ),
            Tab(
              text: "反腐倡廉",
            ),
            Tab(
              text: "时代先锋",
            ),
          ],
          controller: _controller,
          indicatorColor: Colors.red,
          labelColor: Colors.white,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          Center(),
          Center(),
          Center(),
          Center(),
        ],
        controller: _controller,
      ),
    );
  }
}
