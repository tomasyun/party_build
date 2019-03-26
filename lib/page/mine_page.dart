import 'package:flutter/material.dart';
import 'package:party_build/api/global_api.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/global/toast.dart';
import 'package:party_build/page/base_info.dart';
import 'package:party_build/page/credit_page.dart';
import 'package:party_build/page/letter_page.dart';
import 'package:party_build/page/notice_page.dart';
import 'package:party_build/page/rank_page.dart';
import 'package:party_build/page/setting_page.dart';
import 'package:party_build/page/suggest_page.dart';
import 'package:rxdart/rxdart.dart';

//我的
class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MinePageState();
}

class MinePageState extends State<MinePage> {
  // ignore: close_sinks
  var _streamController = new PublishSubject<String>();

  @override
  void initState() {
    super.initState();
    SpUtils().getString("avatar").then((value) {
      _streamController.sink.add(value);
    });
  }

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
        bottom: PreferredSize(
            child: Container(
              padding: EdgeInsets.only(left: 15.0),
              width: double.infinity,
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
                          child: StreamBuilder(
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                  child: ClipOval(
                                    child: FadeInImage.assetNetwork(
                                      placeholder: "images/ic_avatar.png",
                                      //预览图
                                      fit: BoxFit.fitWidth,
                                      image: GlobalApi()
                                          .doFormatImageUrl(url: snapshot.data),
                                      width: 50.0,
                                      height: 50.0,
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  width: 0.0,
                                  height: 0.0,
                                );
                              }
                            },
                            stream: _streamController.stream,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "陕西缔科网络科技有限公司",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white),
                                maxLines: 1,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.0),
                              child: Text(
                                "党委书记",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white),
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
            preferredSize: Size(double.infinity, 150.0)),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.black12,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
              _buildContainer(context, null, "images/ic_collect.png", "收藏")
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
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ))
            ],
          ),
        ));
  }

  Widget _buildContainer(
      BuildContext context, Widget widget, String url, String title) {
    return GestureDetector(
      onTap: () {
        if (widget == null) {
          GlobalToast.showToast("暂未开通");
        } else {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => widget));
        }
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.only(top: 0.5),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(
                url,
                width: 22.0,
                height: 22.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
            ),
            Expanded(
              child: Container(
                alignment: AlignmentDirectional.centerEnd,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black45,
                ),
              ),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
