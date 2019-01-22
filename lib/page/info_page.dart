import 'package:flutter/material.dart';
import 'package:party_build/bloc/info_bloc.dart';
import 'package:party_build/list/info_list.dart';
import 'package:party_build/model/info_model.dart';

//资讯
class InfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  InfoBloc _bloc = InfoBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doInfoRequest(id: "0", draw: "0", start: "0", length: "10");
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
    _controller.addListener(() {
      switch (_controller.index) {
        case 0: //习总讲话
          _bloc.doInfoRequest(id: "0", draw: "0", start: "0", length: "10");
          break;
        case 1: //时政要闻
          _bloc.doInfoRequest(id: "1", draw: "0", start: "0", length: "10");
          break;
        case 2: //反腐倡廉
          _bloc.doInfoRequest(id: "2", draw: "0", start: "0", length: "10");
          break;
        case 3: //时代先锋
          _bloc.doInfoRequest(id: "3", draw: "0", start: "0", length: "10");
          break;
      }
    });
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
          Center(
            child: _inflaterList(),
          ),
          Center(
            child: _inflaterList(),
          ),
          Center(
            child: _inflaterList(),
          ),
          Center(
            child: _inflaterList(),
          ),
        ],
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget _buildList(Info info) {
    return InfoList(data: info.data);
  }

  Widget _inflaterList() {
    return _bloc.streamBuild(
        loading: () {
          return Container(
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ),
            ),
          );
        },
        success: (data) {
          return _buildList(data);
        },
        error: (msg) {
          return Container(
            child: Center(
              child: Text(msg),
            ),
          );
        },
        empty: () {
          return Container(
            child: Center(
              child: Text("暂无数据"),
            ),
          );
        },
        finished: () {});
  }
}
