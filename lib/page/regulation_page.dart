import 'package:flutter/material.dart';
import 'package:party_build/bloc/union_bloc.dart';
import 'package:party_build/item/union_item.dart';
import 'package:party_build/model/union_model.dart';
import 'package:party_build/refresh/behavior.dart';
import 'package:party_build/refresh/header.dart';
import 'package:party_build/refresh/refresher.dart';

class RegulationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegulationState();
}

class RegulationState extends State<RegulationPage> {
  UnionBloc _bloc = UnionBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetUnionRequest(
        articleType: "8",
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
          "规章制度",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: _buildRegulationList(),
    );
  }

  List<UnionItem> _buildRegulationListView(Union union) {
    return union.data.data
        .map((item) =>
        UnionItem(
          model: item,
        ))
        .toList();
  }

  Widget _buildRegulationList() {
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
            children: _buildRegulationListView(data),
          ),
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1), () {
              setState(() {
                _bloc.doGetUnionRequest(
                    articleType: "8",
                    childrenType: "",
                    draw: "0",
                    start: "0",
                    length: "10");
              });
            });
          },
        ),
      );
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
