import 'package:flutter/material.dart';
import 'package:party_build/bloc/org_act_bloc.dart';
import 'package:party_build/list/org_act_list.dart';
import 'package:party_build/model/org_act_model.dart';

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

  Widget _buildOrgActListView(OrgAct org) {
    return OrgActList(
      orgAct: org,
    );
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
        return _buildOrgActListView(data);
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
