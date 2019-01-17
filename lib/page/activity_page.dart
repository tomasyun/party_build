import 'package:flutter/material.dart';
import 'package:party_build/page/branch_parks_page.dart';
import 'package:party_build/page/open_promise_page.dart';
import 'package:party_build/page/org_act_page.dart';
import 'package:party_build/page/party_parks_page.dart';
import 'package:party_build/page/question_sur_page.dart';
import 'package:party_build/page/traning_parks_page.dart';
import 'package:party_build/page/vote_mrg_page.dart';

class ActivityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ActivityState();
}

class ActivityState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "活动管理",
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
                    MaterialPageRoute(builder: (context) => OrgActPage())),
                child: _buildContainer(
                    Colors.orange,
                    "images/ic_org_act.png",
                    "组织活动",
                    EdgeInsets.only(top: 15.0)),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => VoteMrgPage())),
                child: _buildContainer(
                    Colors.blue,
                    "images/ic_vote_mrg.png",
                    "投票管理",
                    EdgeInsets.only(top: 10.0)),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => QuestionSurPage())),
                child: _buildContainer(
                    Colors.red,
                    "images/ic_question_sur.png",
                    "调查问卷",
                    EdgeInsets.only(top: 10.0)),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PartyParksPage())),
                child: _buildContainer(
                    Colors.greenAccent,
                    "images/ic_party_parks.png",
                    "党员园地",
                    EdgeInsets.only(top: 10.0)),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BranchParksPage())),
                child: _buildContainer(
                    Colors.orange,
                    "images/ic_branch_parks.png",
                    "支部园地",
                    EdgeInsets.only(top: 10.0)),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TrainingParksPage())),
                child: _buildContainer(
                    Colors.blue,
                    "images/ic_training_parks.png",
                    "培训园地",
                    EdgeInsets.only(top: 10.0)),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OpenPromisePage())),
                child: _buildContainer(
                    Colors.orange,
                    "images/ic_public_promise.png",
                    "公开承诺",
                    EdgeInsets.only(top: 10.0, bottom: 30.0)),
              )
            ],
          ),
        ),
      ),
    );
  }
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
