import 'package:flutter/material.dart';

class IntegrityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IntegrityState();
}

class IntegrityState extends State<IntegrityPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "廉政建设",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: "廉政教育",
            ),
            Tab(
              text: "监督预防",
            ),
            Tab(
              text: "案例",
            )
          ],
          controller: _controller,
          labelColor: Colors.white,
          indicatorColor: Colors.red,
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
            )
          ],
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
