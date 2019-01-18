import 'package:flutter/material.dart';
import 'package:party_build/bloc/info_bloc.dart';
import 'package:party_build/list/talk_list.dart';
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
        case 0:
          _bloc.doInfoRequest(id: "0", draw: "0", start: "0", length: "10");
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
            child: _bloc.streamBuild(
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
                  return _buildTalkList(data);
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
                finished: () {}),
          ),
          Center(),
          Center(),
          Center(),
        ],
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

//习总讲话
  Widget _buildTalkList(Info info) {
    return TalkListView(data: info.data);
  }
}
