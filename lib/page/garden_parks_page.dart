import 'package:flutter/material.dart';
import 'package:party_build/bloc/union_bloc.dart';
import 'package:party_build/item/union_item.dart';
import 'package:party_build/model/union_model.dart';
import 'package:party_build/refresh/behavior.dart';
import 'package:party_build/refresh/header.dart';
import 'package:party_build/refresh/refresher.dart';

class GardenParksPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GardenParksState();
}

class GardenParksState extends State<GardenParksPage> {
  UnionBloc _bloc = UnionBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetUnionRequest(
        articleType: "7",
        childrenType: "",
        draw: "0",
        start: "0",
        length: "10");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "团员园地",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: _buildGardenParksList(),
    );
  }

  List<UnionItem> _buildGardenParksListView(Union union) {
    return union.data.data
        .map((item) =>
        UnionItem(
          model: item,
        ))
        .toList();
  }

  Widget _buildGardenParksList() {
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
          child: ListView(
            children: _buildGardenParksListView(data),
          ),
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1), () {
              setState(() {
                _bloc.doGetUnionRequest(
                    articleType: "7",
                    childrenType: "",
                    draw: "0",
                    start: "0",
                    length: "10");
              });
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
}
