import 'package:flutter/material.dart';
import 'package:party_build/bloc/union_bloc.dart';
import 'package:party_build/list/union_list.dart';
import 'package:party_build/model/union_model.dart';

class IntegrityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IntegrityState();
}

class IntegrityState extends State<IntegrityPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  UnionBloc _bloc = UnionBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _bloc.doGetUnionRequest(
        articleType: "10",
        childrenType: "",
        draw: "0",
        start: "0",
        length: "10");
    _controller.addListener(() {
      switch (_controller.index) {
        case 0:
          _bloc.doGetUnionRequest(
              articleType: "10",
              childrenType: "",
              draw: "0",
              start: "0",
              length: "10");
          break;
        case 1:
          _bloc.doGetUnionRequest(
              articleType: "11",
              childrenType: "",
              draw: "0",
              start: "0",
              length: "10");
          break;
        case 2:
          _bloc.doGetUnionRequest(
              articleType: "12",
              childrenType: "",
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
              child: _buildIntegrityList(),
            ),
            Center(
              child: _buildIntegrityList(),
            ),
            Center(
              child: _buildIntegrityList(),
            )
          ],
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Widget _buildIntegrityList() {
    return _bloc.streamBuild(loading: () {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      );
    }, success: (data) {
      return _buildListView(data);
    }, empty: () {
      return Container(
        child: Center(
          child: Text("暂无数据"),
        ),
      );
    }, error: (msg) {
      return Container(
        child: Center(
          child: Text(msg),
        ),
      );
    });
  }

  Widget _buildListView(Union union) {
    return UnionList(
      data: union.data,
    );
  }
}
