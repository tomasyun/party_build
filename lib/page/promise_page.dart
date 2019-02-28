import 'package:flutter/material.dart';
import 'package:party_build/bloc/union_bloc.dart';
import 'package:party_build/list/union_list.dart';
import 'package:party_build/model/union_model.dart';

class OpenPromisePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OpenPromiseState();
}

class OpenPromiseState extends State<OpenPromisePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  UnionBloc _bloc = UnionBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
    _bloc.doGetUnionRequest(
        articleType: "13",
        childrenType: "44",
        draw: "0",
        start: "0",
        length: "10");
    _controller.addListener(() {
      switch (_controller.index) {
        case 0:
          _bloc.doGetUnionRequest(
              articleType: "13",
              childrenType: "44",
              draw: "0",
              start: "0",
              length: "10");
          break;
        case 1:
          _bloc.doGetUnionRequest(
              articleType: "13",
              childrenType: "45",
              draw: "0",
              start: "0",
              length: "10");
          break;
        case 2:
          _bloc.doGetUnionRequest(
              articleType: "13",
              childrenType: "46",
              draw: "0",
              start: "0",
              length: "10");
          break;
      }
    });
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
        child: TabBarView(
          children: <Widget>[
            Center(
              child: _buildPromiseList(),
            ),
            Center(
              child: _buildPromiseList(),
            ),
            Center(
              child: _buildPromiseList(),
            )
          ],
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Widget _buildPromiseListView(Union union) {
    return UnionList(
      data: union.data,
    );
  }

  Widget _buildPromiseList() {
    return _bloc.streamBuild(loading: () {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      );
    }, success: (data) {
      return _buildPromiseListView(data);
    }, error: (msg) {
      return Container(
        child: Center(
          child: Text(msg),
        ),
      );
    }, empty: () {
      return Container(
        child: Center(
          child: Text("暂无数据"),
        ),
      );
    });
  }
}
