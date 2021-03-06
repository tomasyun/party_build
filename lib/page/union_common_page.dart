import 'package:flutter/material.dart';
import 'package:party_build/bloc/union_bloc.dart';
import 'package:party_build/item/union_item.dart';
import 'package:party_build/model/union_model.dart';
import 'package:party_build/refresh/behavior.dart';
import 'package:party_build/refresh/footer.dart';
import 'package:party_build/refresh/header.dart';
import 'package:party_build/refresh/refresher.dart';

// ignore: must_be_immutable
class UnionCommonPage extends StatefulWidget {
  int skipType;
  String pageTitle;

  UnionCommonPage({this.skipType, this.pageTitle});

  @override
  State<StatefulWidget> createState() => UnionCommonState();
}

class UnionCommonState extends State<UnionCommonPage> {
  UnionBloc _bloc = UnionBloc.newInstance;
  String start = "0";
  List<UnionModel> unionModels;

  void doUnionRequest(int type) {
    switch (type) {
      case 0:
        _bloc.doGetUnionRequest(
            articleType: "1",
            childrenType: "36",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 1:
        _bloc.doGetUnionRequest(
            articleType: "1",
            childrenType: "35",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 2:
        _bloc.doGetUnionRequest(
            articleType: "1",
            childrenType: "37",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 3:
        _bloc.doGetUnionRequest(
            articleType: "2",
            childrenType: "42",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 4:
        _bloc.doGetUnionRequest(
            articleType: "2",
            childrenType: "43",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 5:
        _bloc.doGetUnionRequest(
            articleType: "3",
            childrenType: "38",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 6:
        _bloc.doGetUnionRequest(
            articleType: "3",
            childrenType: "39",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 7:
        _bloc.doGetUnionRequest(
            articleType: "3",
            childrenType: "40",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 8:
        _bloc.doGetUnionRequest(
            articleType: "3",
            childrenType: "41",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 9:
        _bloc.doGetUnionRequest(
            articleType: "4",
            childrenType: "26",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 10:
        _bloc.doGetUnionRequest(
            articleType: "4",
            childrenType: "24",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 11:
        _bloc.doGetUnionRequest(
            articleType: "4",
            childrenType: "25",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 12:
        _bloc.doGetUnionRequest(
            articleType: "4",
            childrenType: "27",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 13:
        _bloc.doGetUnionRequest(
            articleType: "4",
            childrenType: "28",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 14:
        _bloc.doGetUnionRequest(
            articleType: "4",
            childrenType: "30",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 15:
        _bloc.doGetUnionRequest(
            articleType: "4",
            childrenType: "29",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 16:
        _bloc.doGetUnionRequest(
            articleType: "0",
            childrenType: "18",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 17:
        _bloc.doGetUnionRequest(
            articleType: "0",
            childrenType: "19",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 18:
        _bloc.doGetUnionRequest(
            articleType: "0",
            childrenType: "20",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 19:
        _bloc.doGetUnionRequest(
            articleType: "0",
            childrenType: "21",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 20:
        _bloc.doGetUnionRequest(
            articleType: "0",
            childrenType: "22",
            draw: "0",
            start: start,
            length: "10");
        break;
      case 21:
        _bloc.doGetUnionRequest(
            articleType: "0",
            childrenType: "23",
            draw: "0",
            start: start,
            length: "10");
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    doUnionRequest(widget.skipType);
    unionModels = List<UnionModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pageTitle,
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: _bloc.streamBuild(loading: () {
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
      }),
    );
  }

  List<UnionItem> _buildUnionList(Union union) {
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
              children: _buildUnionList(union),
            ),
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1), () {
                start = "0";
                doUnionRequest(widget.skipType);
              });
            },
            loadMore: () async {
              await Future.delayed(const Duration(seconds: 1), () {
                start = (int.parse(start) + 10).toString();
                doUnionRequest(widget.skipType);
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
}
