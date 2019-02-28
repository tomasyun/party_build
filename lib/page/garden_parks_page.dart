import 'package:flutter/material.dart';
import 'package:party_build/bloc/union_bloc.dart';
import 'package:party_build/list/union_list.dart';
import 'package:party_build/model/union_model.dart';

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

  Widget _buildGardenParksListView(Union union) {
    return UnionList(
      data: union.data,
    );
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
      return _buildGardenParksListView(data);
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
