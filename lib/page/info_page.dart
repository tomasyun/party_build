import 'package:flutter/material.dart';
import 'package:party_build/bloc/info_bloc.dart';
import 'package:party_build/item/info_item.dart';
import 'package:party_build/model/info_model.dart';
import 'package:party_build/refresh/behavior.dart';
import 'package:party_build/refresh/footer.dart';
import 'package:party_build/refresh/header.dart';
import 'package:party_build/refresh/refresher.dart';

//资讯
class InfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage>
    with SingleTickerProviderStateMixin {
  InfoBloc _bloc = InfoBloc.newInstance;
  TabController _controller;
  List<InfoModel> infoModels;
  String start = "0";

  @override
  void initState() {
    super.initState();
    _bloc.doInfoRequest(id: "0", draw: "0", start: "0", length: "10");
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
    _controller.addListener(() {
      start = "0";
      if (_controller.indexIsChanging) {
        _bloc.doInfoRequest(
            id: _controller.index.toString(),
            draw: "0",
            start: start,
            length: "10");
      }
    });
    infoModels = List<InfoModel>();
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
          _inflateList(),
          _inflateList(),
          _inflateList(),
          _inflateList(),
        ],
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget _buildList(Info info) {
    return Center(
      child: EasyRefresh(
        key: GlobalKey<EasyRefreshState>(),
        behavior: ScrollOverBehavior(),
        refreshHeader: ClassicsHeader(
          key: GlobalKey<RefreshHeaderState>(),
          bgColor: Colors.transparent,
          textColor: Colors.black87,
          moreInfoColor: Colors.black54,
          showMore: true,
        ),
        refreshFooter: ClassicsFooter(
          key: GlobalKey<RefreshFooterState>(),
          bgColor: Colors.transparent,
          textColor: Colors.black87,
          moreInfoColor: Colors.black54,
          showMore: true,
        ),
        child: ListView(
          children: _buildInfoList(info.data),
        ),
        onRefresh: () async {
          await new Future.delayed(const Duration(seconds: 1), () {
            start = "0";
            _bloc.doInfoRequest(
                id: _controller.index.toString(),
                draw: "0",
                start: start,
                length: "10");
          });
        },
        loadMore: () async {
          await new Future.delayed(const Duration(seconds: 1), () {
            start = (int.parse(start) + 10).toString();
            _bloc.doInfoRequest(
                id: _controller.index.toString(),
                draw: "0",
                start: start,
                length: "10");
          });
        },
      ),
    );
  }

  List<InfoItem> _buildInfoList(InfoData data) {
    if (start == "0") {
      infoModels = data.data;
      return infoModels
          .map((item) =>
          InfoItem(
            model: item,
          ))
          .toList();
    } else {
      infoModels.addAll(data.data);
      return infoModels
          .map((item) =>
          InfoItem(
            model: item,
          ))
          .toList();
    }
  }

  Widget _inflateList() {
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
