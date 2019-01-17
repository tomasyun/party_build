import 'package:flutter/material.dart';
import 'package:party_build/page/base_info.dart';
import 'package:party_build/page/collect_page.dart';
import 'package:party_build/page/credit_page.dart';
import 'package:party_build/page/letter_page.dart';
import 'package:party_build/page/notice_page.dart';
import 'package:party_build/page/rank_page.dart';
import 'package:party_build/page/setting_page.dart';
import 'package:party_build/page/suggest_page.dart';

//我的
class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MinePageState();
}

class MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "我的",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: null,
        backgroundColor: Colors.red,
        actions: <Widget>[
          _buildGestureDetectorAction(
              context, NoticePage(), "images/ic_notice.png"),
          _buildGestureDetectorAction(
              context, SettingPage(), "images/ic_setting.png")
        ],
      ),
      body: Container(
        height: double.infinity,
        color: Colors.black12,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 15.0),
                width: double.infinity,
                height: 150.0,
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 15.0, bottom: 25.0),
                          child: GestureDetector(
                            onTap: () => {},
                            child: Image.asset(
                              "images/ic_avatar.png",
                              width: 50.0,
                              height: 50.0,
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "陕西缔科网络科技有限公司",
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                  maxLines: 1,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "党委书记",
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildGestureDetectorCredit(
                        context, CreditPage(), "images/ic_rank.png", "积分"),
                    Container(
                      width: 1.0,
                      height: 20.0,
                      color: Colors.black12,
                    ),
                    _buildGestureDetectorCredit(
                        context, RankPage(), "images/ic_credits.png", "排行")
                  ],
                ),
              ),
              _buildContainer(
                  context, BaseInfoPage(), "images/ic_base.png", "基本信息"),
              _buildContainer(
                  context, LetterPage(), "images/ic_letter.png", "信箱"),
              _buildContainer(
                  context, SuggestPage(), "images/ic_suggest.png", "意见反馈"),
              _buildContainer(
                  context, CollectPage(), "images/ic_collect.png", "收藏")
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGestureDetectorAction(
      BuildContext context, Widget widget, String url) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => widget)),
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Image.asset(
          url,
          width: 18.0,
          height: 18.0,
        ),
      ),
    );
  }

  Widget _buildGestureDetectorCredit(
      BuildContext context, Widget widget, String url, String title) {
    return GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget)),
        child: Container(
          margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
          child: Row(
            children: <Widget>[
              Image.asset(
                url,
                width: 22.0,
                height: 22.0,
              ),
              Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  ))
            ],
          ),
        ));
  }

  Widget _buildContainer(
      BuildContext context, Widget widget, String url, String title) {
    return Container(
      margin: EdgeInsets.only(top: 0.5),
      color: Colors.white,
      child: ListTile(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget)),
        leading: Image.asset(
          url,
          width: 22.0,
          height: 22.0,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}