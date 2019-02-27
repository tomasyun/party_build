import 'package:flutter/material.dart';
import 'package:party_build/bloc/union_bloc.dart';
import 'package:party_build/list/union_list.dart';
import 'package:party_build/model/union_model.dart';

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

  @override
  void initState() {
    super.initState();
    switch (widget.skipType) {
      case 0:
        _bloc.doGetUnionRequest(
            articleType: "1",
            childrenType: "36",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 1:
        _bloc.doGetUnionRequest(
            articleType: "1",
            childrenType: "35",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 2:
        _bloc.doGetUnionRequest(
            articleType: "1",
            childrenType: "37",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 3:
        _bloc.doGetUnionRequest(
            articleType: "2",
            childrenType: "42",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 4:
        _bloc.doGetUnionRequest(
            articleType: "2",
            childrenType: "43",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 5:
        _bloc.doGetUnionRequest(
            articleType: "3",
            childrenType: "38",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 6:
        _bloc.doGetUnionRequest(
            articleType: "3",
            childrenType: "39",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 7:
        _bloc.doGetUnionRequest(
            articleType: "3",
            childrenType: "40",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 8:
        _bloc.doGetUnionRequest(
            articleType: "3",
            childrenType: "41",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 9:
        _bloc.doGetUnionRequest(
            articleType: "4",
            childrenType: "26",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 10:
        _bloc.doGetUnionRequest(
            articleType: "4",
            childrenType: "24",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 11:
        _bloc.doGetUnionRequest(
            articleType: "4",
            childrenType: "25",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 12:
        _bloc.doGetUnionRequest(
            articleType: "4",
            childrenType: "27",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 13:
        _bloc.doGetUnionRequest(
            articleType: "4",
            childrenType: "28",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 14:
        _bloc.doGetUnionRequest(
            articleType: "4",
            childrenType: "30",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 15:
        _bloc.doGetUnionRequest(
            articleType: "4",
            childrenType: "29",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 16:
        _bloc.doGetUnionRequest(
            articleType: "0",
            childrenType: "18",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 17:
        _bloc.doGetUnionRequest(
            articleType: "0",
            childrenType: "19",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 18:
        _bloc.doGetUnionRequest(
            articleType: "0",
            childrenType: "20",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 19:
        _bloc.doGetUnionRequest(
            articleType: "0",
            childrenType: "21",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 20:
        _bloc.doGetUnionRequest(
            articleType: "0",
            childrenType: "22",
            draw: "0",
            start: "0",
            length: "10");
        break;
      case 21:
        _bloc.doGetUnionRequest(
            articleType: "0",
            childrenType: "23",
            draw: "0",
            start: "0",
            length: "10");
        break;
    }
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
      body: _bloc.streamBuild(
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
            return _buildUnionList(data);
          },
          error: (msg) {
            return Container(
              child: Center(
                child: Text(msg),
              ),
            );
          },
          empty: () {}),
    );
  }

  Widget _buildUnionList(Union union) {
    return UnionList(
      data: union.data,
    );
  }
}
