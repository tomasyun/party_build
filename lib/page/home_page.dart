import 'package:flutter/material.dart';
import 'package:party_build/banner/banner.dart';
import 'package:party_build/banner/banner_item.dart';
import 'package:party_build/bloc/home_bloc.dart';
import 'package:party_build/global/toast.dart';
import 'package:party_build/marquee/marquee.dart';
import 'package:party_build/model/banner_bean.dart';
import 'package:party_build/model/home_model.dart';
import 'package:party_build/page/activity_page.dart';
import 'package:party_build/page/integrity_page.dart';
import 'package:party_build/page/mail_page.dart';
import 'package:party_build/page/meeting_page.dart';
import 'package:party_build/page/mission_page.dart';
import 'package:party_build/page/task_page.dart';
import 'package:party_build/page/union_page.dart';

//首页
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _bloc.doGetHomeDataRequest();
  }

  var entity = [
    BannerBean(
        url:
            'http://p1.img.cctvpic.com/photoworkspace/2018/05/18/2018051814594647287.jpg',
        title: '治愈系小可爱和你说晚安~'),
    BannerBean(
        url:
            'http://p1.img.cctvpic.com/photoworkspace/2018/05/18/2018051814220084352.jpg',
        title: '“太妃糖”：麻麻，我走啦！'),
    BannerBean(
        url:
            'http://p1.img.cctvpic.com/photoworkspace/2018/05/18/2018051814245872100.jpg',
        title: '冷静冷静，这也太有爱了吧~'),
    BannerBean(
        url:
            'http://p1.img.cctvpic.com/photoworkspace/2018/05/18/2018051814175817985.jpg',
        title: '“福豹”：跟我一起嗨~'),
  ];

  HomeBloc _bloc = HomeBloc.newInstance;

  Widget _buildHomeBody() {
    return _bloc.streamBuild(loading: () {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      );
    }, success: (data) {
      return _buildHomeContent(data);
    }, error: (msg) {
      return Container(
        child: Center(
          child: Text(msg),
        ),
      );
    }, empty: () {
      return Container(
        child: Center(
          child: Text("暂无数据"),
        ),
      );
    });
  }

  List<BannerItem> _initBanner(Home home) {
    return home.data.advertisement
        .map((item) => BannerBean(url: item.advertImg, title: item.advertTitle))
        .toList();
  }

  Widget _buildHomeContent(Home home) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: BannerWidget(
                entity: entity,
                delayTime: 500,
                duration: 1000,
                bannerPress: (position, entity) {
                  GlobalToast.showToast(entity.bTitle);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Text("公示",
                      style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold)),
                  Text("公告",
                      style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.red,
                          fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: MarqueeText(
                      "陕西缔科网络科技有限公司",
                      speed: 10.0,
                      gap: 100.0,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Container(
                    //第一行
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                right: 50.0,
                                left: 50.0),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Image.asset(
                                    "images/ic_meeting.png",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "三会一课",
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MeetingPage())),
                        ),
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                right: 50.0,
                                left: 50.0),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Image.asset(
                                    "images/ic_activity.png",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "活动管理",
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ActivityPage())),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    //第二行
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                right: 50.0,
                                left: 50.0),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Image.asset(
                                    "images/ic_studies.png",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "学习任务",
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      TaskPage())),
                        ),
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                right: 50.0,
                                left: 50.0),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Image.asset(
                                    "images/ic_dues.png",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "党费缴纳",
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            GlobalToast.showToast("暂未开通");
                          },
//                              onTap: () => Navigator.of(context).push(
//                                  MaterialPageRoute(
//                                      builder: (BuildContext context) =>
//                                          DuesPage())),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //第三行
                    margin: EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                right: 50.0,
                                left: 50.0),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Image.asset(
                                    "images/ic_integrity_build.png",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "廉政建设",
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      IntegrityPage())),
                        ),
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                right: 50.0,
                                left: 50.0),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Image.asset(
                                    "images/ic_union_work.png",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "工会工作",
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      UnionPage())),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //第四行
                    margin: EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                right: 50.0,
                                left: 50.0),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Image.asset(
                                    "images/ic_meeting.png",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "团青园地",
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MissionPage())),
                        ),
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                right: 50.0,
                                left: 50.0),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Image.asset(
                                    "images/ic_mail.png",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "领导信箱",
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MailPage())),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: _buildHomeBody(),
    );
  }
}
