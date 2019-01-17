import 'package:flutter/material.dart';
import 'package:party_build/page/announce_page.dart';
import 'package:party_build/page/branch_parks_page.dart';
import 'package:party_build/page/garden_parks_page.dart';
import 'package:party_build/page/org_situation_page.dart';
import 'package:party_build/page/regulation_page.dart';

class MissionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MissionState();
}

class MissionState extends State<MissionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "团青园地",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AnnouncePage())),
                child: _buildContainer(
                    Colors.orange,
                    "images/ic_notice_announce.png",
                    "公告通知",
                    EdgeInsets.only(top: 15.0)),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BranchParksPage())),
                child: _buildContainer(
                    Colors.blue,
                    "images/ic_branch_parks.png",
                    "支部园地",
                    EdgeInsets.only(top: 10.0)),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GardenParksPage())),
                child: _buildContainer(
                    Colors.red,
                    "images/ic_garden_parks.png",
                    "团员园地",
                    EdgeInsets.only(top: 10.0)),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegulationPage())),
                child: _buildContainer(
                    Colors.greenAccent,
                    "images/ic_regulation.png",
                    "规章制度",
                    EdgeInsets.only(top: 10.0)),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OrgSituationPage())),
                child: _buildContainer(
                    Colors.orange,
                    "images/ic_org_situation.png",
                    "组织机构",
                    EdgeInsets.only(top: 10.0, bottom: 30.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(
      Color color, String url, String title, EdgeInsetsGeometry edge) {
    return Container(
      margin: edge,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            url,
            width: 130,
            height: 130,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          )
        ],
      ),
    );
  }
}

