import 'package:flutter/material.dart';

class BranchParksPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BranchParksState();
}

class BranchParksState extends State<BranchParksPage>
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
          "支部园地",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: "公告通知",
            ),
            Tab(
              text: "支部活动",
            ),
            Tab(
              text: "发展党员",
            ),
            Tab(
              text: "各种台账",
            )
          ],
          labelColor: Colors.white,
          indicatorColor: Colors.red,
          controller: _controller,
        ),
      ),
      body: Center(
        child: TabBarView(
          children: [
            Center(
            ),
            Center(
            ),
            Center(
            ),
            Center(
            )
          ],
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),//禁止滑动
        ),
      ),
    );
  }
}
