import 'package:flutter/material.dart';
import 'package:party_build/bloc/org_act_bloc.dart';
import 'package:party_build/item/org_act_item.dart';
import 'package:party_build/model/org_act_model.dart';
import 'package:party_build/refresh/behavior.dart';
import 'package:party_build/refresh/header.dart';
import 'package:party_build/refresh/refresher.dart';

class OrgActPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OrgActState();
}

class OrgActState extends State<OrgActPage> {
  OrgActBloc _bloc = OrgActBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetOrgActRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "组织活动",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: _buildOrgActList(),
      ),
    );
  }

  List<OrgActItem> _buildOrgActListView(OrgAct org) {
    return org.data
        .map((item) => OrgActItem(
              model: item,
            ))
        .toList();
  }

  Widget _buildOrgActList() {
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
              children: _buildOrgActListView(data),
            ),
            onRefresh: () async {
              await new Future.delayed(const Duration(seconds: 1), () {
                setState(() {
                  _bloc.doGetOrgActRequest();
                });
              });
            },
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
      error: (msg) {},
    );
  }
}
