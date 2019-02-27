import 'package:flutter/material.dart';
import 'package:party_build/bloc/org_act_info_bloc.dart';

// ignore: must_be_immutable
class OrgActInfoPage extends StatefulWidget {
  String id;

  OrgActInfoPage({this.id});

  @override
  State<StatefulWidget> createState() => OrgActInfoState();
}

class OrgActInfoState extends State<OrgActInfoPage> {
  OrgActInfoBloc _bloc = OrgActInfoBloc.newInstance;
  bool _brief = false;
  bool _participants = false;

  @override
  void initState() {
    super.initState();
    _bloc.doGetOrgActRequest(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "活动摘要",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: _buildOrgActInfoContent(),
          )),
    );
  }

  Widget _buildOrgActInfoContent() {
    return Container(
      margin: EdgeInsets.only(bottom: 100.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Image.network(
                "http://p1.img.cctvpic.com/photoworkspace/2018/05/18/2018051814175817985.jpg"),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 15.0),
            padding: EdgeInsets.all(15.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                _buildContainer("主题", "聚焦两会,关注民生"),
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.black12,
                ),
                _buildContainer("时间", "2018-12-25"),
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.black12,
                ),
                _buildContainer("地点", "陕西省西安市高新区丈八一路汇鑫IBC 1005室"),
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.black12,
                ),
                _buildContainer("主讲", "贠拓"),
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.black12,
                ),
                _buildContainer("类别", "党员支部大会"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0),
            child: _buildBriefExpansionPanelList(
                title: "简介", content: "陕西缔科网络科技有限公司"),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0),
            child: _buildParticipantsExpansionPanelList(
                title: "参会人", content: "12"),
          )
        ],
      ),
    );
  }

  Widget _buildContainer(String title, String subTitle) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16.0, color: Colors.black45, letterSpacing: 5.0),
            ),
            margin: EdgeInsets.only(right: 30.0),
          ),
          Expanded(
            child: Container(
              child: Text(
                subTitle,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            flex: 1,
          )
        ],
      ),
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
    );
  }

  Widget _buildBriefExpansionPanelList({String title, String content}) {
    return ExpansionPanelList(
        expansionCallback: (int panelIndex, bool isExpanded) {
          setState(() {
            _brief = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                color: Colors.white,
                padding: EdgeInsets.all(15.0),
                child: Container(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black45,
                        letterSpacing: 5.0),
                  ),
                ),
              );
            },
            body: Container(
              padding: EdgeInsets.all(15.0),
              width: double.infinity,
              child: Text(
                content,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
            ),
            isExpanded: _brief,
          ),
        ]);
  }

  Widget _buildParticipantsExpansionPanelList({String title, String content}) {
    return ExpansionPanelList(
        expansionCallback: (int panelIndex, bool isExpanded) {
          setState(() {
            _participants = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                color: Colors.white,
                padding: EdgeInsets.all(15.0),
                child: Container(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black45,
                        letterSpacing: 5.0),
                  ),
                ),
              );
            },
            body: Container(
              padding: EdgeInsets.all(15.0),
              width: double.infinity,
              child: Text(
                content,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
            ),
            isExpanded: _participants,
          ),
        ]);
  }
}
