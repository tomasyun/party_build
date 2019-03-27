import 'package:flutter/material.dart';
import 'package:party_build/bloc/union_bloc.dart';
import 'package:party_build/item/union_item.dart';
import 'package:party_build/model/union_model.dart';
import 'package:party_build/refresh/behavior.dart';
import 'package:party_build/refresh/footer.dart';
import 'package:party_build/refresh/header.dart';
import 'package:party_build/refresh/refresher.dart';

class OpenPromisePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OpenPromiseState();
}

class OpenPromiseState extends State<OpenPromisePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  UnionBloc _bloc = UnionBloc.newInstance;
  String start = "0";
  List<UnionModel> unionModels;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
    _bloc.doGetUnionRequest(
        articleType: "13",
        childrenType: "44",
        draw: "0",
        start: start,
        length: "10");
    _controller.addListener(() {
      start = "0";
      if (_controller.indexIsChanging) {
        _bloc.doGetUnionRequest(
            articleType: "13",
            childrenType: (_controller.index + 44).toString(),
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
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
      body: Center(
        child: TabBarView(
          children: <Widget>[
            _buildPromiseList(),
            _buildPromiseList(),
            _buildPromiseList(),
          ],
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  List<UnionItem> _buildPromiseListView(Union union) {
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

  Widget _buildStateView(Union union) {
    if (union.code == "0000") {
      if (union.data.data != null && union.data.data.isNotEmpty) {
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
              children: _buildPromiseListView(union),
            ),
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1), () {
                start = "0";
                _bloc.doGetUnionRequest(
                    articleType: "13",
                    childrenType: (_controller.index + 44).toString(),
                    draw: "0",
                    start: start,
                    length: "10");
              });
            },
            loadMore: () async {
              await Future.delayed(const Duration(seconds: 1), () {
                start = (int.parse(start) + 10).toString();
                _bloc.doGetUnionRequest(
                    articleType: "13",
                    childrenType: (_controller.index + 44).toString(),
                    draw: "0",
                    start: start,
                    length: "10");
              });
            },
          ),
        );
      } else {
        return Container(
          child: Center(
            child: Text("暂无数据"),
          ),
        );
      }
    } else {
      return Container(
        width: 0.0,
        height: 0.0,
      );
    }
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
      return _buildStateView(data);
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
