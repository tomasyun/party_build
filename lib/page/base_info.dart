import 'package:flutter/material.dart';
import 'package:party_build/bloc/base_info_bloc.dart';
import 'package:party_build/model/base_info_model.dart';

class BaseInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BaseInfoState();
}

class BaseInfoState extends State<BaseInfoPage> {
  BaseInfoBloc _bloc = BaseInfoBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetBaseInfoRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "基本信息",
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: _buildBaseInfoView());
  }

  Widget _buildContainer(EdgeInsetsGeometry edge, String title1, String title2,
      int maxLines) {
    return Container(
      margin: edge,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Text(
              title1,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              title2,
              style: TextStyle(fontSize: 16.0, color: Colors.black),
              textAlign: TextAlign.right,
              maxLines: maxLines,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBaseInfoView() {
    return _bloc.streamBuild(loading: () {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      );
    }, success: (data) {
      return _buildBaseInfoContent(data);
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

  Widget _buildBaseInfoContent(BaseInfo info) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "头像",
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      "images/ic_avatar.png",
                      width: 40.0,
                      height: 40.0,
                    ),
                  )
                ],
              ),
            ),
            _buildContainer(
                EdgeInsets.only(top: 10.0), "用户名", "陕西缔科网络科技有限公司", 2),
            _buildContainer(EdgeInsets.only(top: 10.0), "姓名", "缔科", 2),
            _buildContainer(EdgeInsets.only(top: 10.0), "党员编号", "007", 2),
            _buildContainer(EdgeInsets.only(top: 10.0), "所属党支部", "通昱消防", 2),
            _buildContainer(
                EdgeInsets.only(top: 10.0), "进入党支部时间", "2013-10-21", 2),
            _buildContainer(EdgeInsets.only(top: 10.0), "所属类型", "消防工程机械", 2),
            _buildContainer(
                EdgeInsets.only(top: 10.0), "单位", "国家能源建设集团甘肃省电力设计院有限公司", 2),
            _buildContainer(
                EdgeInsets.only(top: 10.0), "出生日期", "1990-02-28", 2),
            _buildContainer(
                EdgeInsets.only(top: 10.0), "联系电话", "13096962939", 2),
            _buildContainer(EdgeInsets.only(top: 10.0), "民族", "汉族", 2),
            _buildContainer(EdgeInsets.only(top: 10.0), "籍贯", "甘肃省", 2),
            _buildContainer(EdgeInsets.only(top: 10.0), "最高学历", "博士", 2),
            _buildContainer(EdgeInsets.only(top: 10.0), "个人简介",
                "成龙，1954年4月7日生于香港中西区，祖籍安徽芜湖，国家一级演员，大中华区影坛和国际功夫影星。", 6)
          ],
        ),
      ),
    );
  }
}
