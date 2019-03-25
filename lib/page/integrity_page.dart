import 'package:flutter/material.dart';
import 'package:party_build/bloc/union_bloc.dart';
import 'package:party_build/item/union_item.dart';
import 'package:party_build/model/union_model.dart';
import 'package:party_build/refresh/behavior.dart';
import 'package:party_build/refresh/footer.dart';
import 'package:party_build/refresh/header.dart';
import 'package:party_build/refresh/refresher.dart';

class IntegrityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IntegrityState();
}

class IntegrityState extends State<IntegrityPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  UnionBloc _bloc = UnionBloc.newInstance;
  List<UnionModel> unionModels;
  String start = "0";

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _bloc.doGetUnionRequest(
        articleType: "10",
        childrenType: "",
        draw: "0",
        start: start,
        length: "10");
    _controller.addListener(() {
      start = "0";
      if (_controller.indexIsChanging) {
        _bloc.doGetUnionRequest(
            articleType: (_controller.index + 10).toString(),
            childrenType: "",
            draw: "0",
            start: start,
            length: "10");
      }
    });
    unionModels = List<UnionModel>();
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
            _buildIntegrityList(),
            _buildIntegrityList(),
            _buildIntegrityList(),
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
            children: _buildListView(data),
          ),
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1), () {
              start = "0";
              _bloc.doGetUnionRequest(
                  articleType: (_controller.index + 10).toString(),
                  childrenType: "",
                  draw: "0",
                  start: start,
                  length: "10");
            });
          },
          loadMore: () async {
            await Future.delayed(const Duration(seconds: 1), () {
              start = (int.parse(start) + 10).toString();
              _bloc.doGetUnionRequest(
                  articleType: (_controller.index + 10).toString(),
                  childrenType: "",
                  draw: "0",
                  start: start,
                  length: "10");
            });
          },
        ),
      );
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

  List<UnionItem> _buildListView(Union union) {
    if (start == "0") {
      unionModels = union.data.data;
      return unionModels
          .map((item) => UnionItem(
                model: item,
              ))
          .toList();
    } else {
      unionModels.addAll(union.data.data);
      return unionModels
          .map((item) => UnionItem(
                model: item,
              ))
          .toList();
    }
  }
}
