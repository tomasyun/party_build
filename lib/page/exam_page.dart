import 'package:flutter/material.dart';
import 'package:party_build/model/exam_pending.dart';
import 'package:party_build/page/exam_info_page.dart';

//考试
class ExamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExamPageState();
}

class ExamPageState extends State<ExamPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  _init() {
    return <ExamPending>[
      const ExamPending(title: "陕西缔科网络科技有限公司年终考核", limitDate: "2018-12-25"),
    ];
  }

  void _clickItem() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ExamInfoPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "考试",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: null,
        backgroundColor: Colors.red,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: "待考",
            ),
            Tab(
              text: "已考",
            )
          ],
          controller: _controller,
          indicatorColor: Colors.red,
          labelColor: Colors.white,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          Center(
            child: _buildPendingList(_init()),
          ),
          Center()
        ],
        controller: _controller,
      ),
    );
  }

  Widget _buildPendingItem(ExamPending _pending) {
    return Container(
      color: Colors.white,
      child: ListTile(
        onTap: _clickItem,
        title: Text(
          _pending.title,
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              child: Container(
                child: Text(
                  _pending.limitDate,
                  style: TextStyle(color: Colors.black45),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0, top: 15.0),
              child: Text(
                "截止时间",
                style: TextStyle(color: Colors.black45),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPendingList(List<ExamPending> _list) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      children: _list.map((item) => _buildPendingItem(item)).toList(),
    );
  }
}
