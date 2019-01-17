import 'package:flutter/material.dart';

class OpenPromisePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OpenPromiseState();
}

class OpenPromiseState extends State<OpenPromisePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "公开承诺",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: "党委承诺",
            ),
            Tab(
              text: "支部承诺",
            ),
            Tab(
              text: "党员承诺",
            )
          ],
          labelColor: Colors.white,
          indicatorColor: Colors.red,
          controller: _controller,
        ),
      ),
      body: Center(
        child: TabBarView(children: <Widget>[
          Center(
            child: Text("党委承诺"),
          ),
          Center(
            child: Text("支部承诺"),
          ),
          Center(
            child: Text("党员承诺"),
          )
        ],controller: _controller,),
      ),
    );
  }
}
