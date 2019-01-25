import 'package:flutter/material.dart';
import 'package:party_build/bloc/rank_bloc.dart';
import 'package:party_build/list/rank_list.dart';
import 'package:party_build/model/rank_model.dart';

class RankPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RankState();
}

class RankState extends State<RankPage> {
  RankBloc _bloc = RankBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetRankRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "排行榜",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        bottom: PreferredSize(
            child: Container(
              margin: EdgeInsets.only(bottom: 50.0),
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildRichText("26", "名"),
                  Image.asset(
                    "images/ic_avatar.png",
                    width: 50.0,
                    height: 50.0,
                  ),
                  _buildRichText("245", "分"),
                ],
              ),
            ),
            preferredSize: Size(double.infinity, 200.0)),
      ),
      body: Center(
        child: _buildRankList(),
      ),
    );
  }

  Widget _buildRichText(String text1, String text2) {
    return RichText(
        text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: text1, style: TextStyle(fontSize: 22, color: Colors.white)),
          TextSpan(text: text2, style: TextStyle(fontSize: 14, color: Colors.white))
        ]));
  }

  Widget _buildCreditRankListView(Rank rank) {
    return RankList(
      rank: rank,
    );
  }

  Widget _buildRankList() {
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
          return _buildCreditRankListView(data);
        },
        error: (msg) {},
        empty: () {
          return Container(
            child: Center(
              child: Text("暂无数据"),
            ),
          );
        });
  }
}
