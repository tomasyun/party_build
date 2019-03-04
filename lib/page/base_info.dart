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

  Widget _buildContainer(
      EdgeInsetsGeometry edge, String title1, String title2, int maxLines) {
    return Container(
      margin: edge,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Text(
              title1,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              title2,
              style: TextStyle(fontSize: 14.0, color: Colors.black54),
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
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
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
                EdgeInsets.only(top: 10.0), "用户名", info.data.username, 2),
            _buildContainer(
                EdgeInsets.only(top: 10.0), "姓名", info.data.name, 2),
            _buildContainer(
                EdgeInsets.only(top: 10.0), "党员编号", info.data.partyNo, 2),
            _buildContainer(
                EdgeInsets.only(top: 10.0), "所属党支部", info.data.belongBranch, 2),
            _buildContainer(
                EdgeInsets.only(top: 10.0), "进入党支部时间", info.data.enterDate, 2),
            _buildContainer(
                EdgeInsets.only(top: 10.0), "所属类型", info.data.enterType, 2),
            _buildContainer(
                EdgeInsets.only(top: 10.0), "单位", info.data.company, 2),
            _buildContainer(
                EdgeInsets.only(top: 10.0), "出生日期", info.data.birthday, 2),
            _buildContainer(
                EdgeInsets.only(top: 10.0), "联系电话", info.data.phone, 2),
            _buildContainer(
                EdgeInsets.only(top: 10.0), "民族", info.data.ethnic, 2),
            _buildContainer(
                EdgeInsets.only(top: 10.0), "籍贯", info.data.birthPlace, 2),
            _buildContainer(
                EdgeInsets.only(top: 10.0), "最高学历", info.data.education, 2),
            _buildContainer(
                EdgeInsets.only(top: 10.0), "简介", info.data.brief, 6)
          ],
        ),
      ),
    );
  }
}
