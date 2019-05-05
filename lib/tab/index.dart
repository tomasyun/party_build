import 'package:flutter/material.dart';
import 'package:party_build/global/toast.dart';
import 'package:party_build/page/exam_page.dart';
import 'package:party_build/page/home_page.dart';
import 'package:party_build/page/info_page.dart';
import 'package:party_build/page/mine_page.dart';
import 'package:party_build/page/sign_page.dart';
import 'package:party_build/tab/nav_item.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<Index> with TickerProviderStateMixin {
  int _currentIndex = 0;
  var tabImages;

/*
   * 存储的四个页面，和Fragment一样
   */
  List<StatefulWidget> _bodys;

  /*
   * 根据image路径获取图片
   * 这个图片的路径需要在 pubspec.yaml 中去定义
   */
  Image getTabImage(path) {
    return Image.asset(path, width: 20.0, height: 20.0);
  }

  /*
   * 根据索引获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _currentIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  void initIcon() {
    tabImages = [
      [
        getTabImage("images/ic_home_normal.png"),
        getTabImage("images/ic_home_press.png")
      ],
      [
        getTabImage("images/ic_info_normal.png"),
        getTabImage("images/ic_info_press.png")
      ],
      [
        getTabImage("images/ic_exam_normal.png"),
        getTabImage("images/ic_exam_press.png")
      ],
      [
        getTabImage("images/ic_sign_normal.png"),
        getTabImage("images/ic_sign_press.png")
      ],
      [
        getTabImage("images/ic_mine_normal.png"),
        getTabImage("images/ic_mine_press.png")
      ]
    ];

    _bodys = <StatefulWidget>[
      HomePage(),
      InfoPage(),
      SignPage(),
      ExamPage(),
      MinePage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    initIcon();
    BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
        items: <NavItem>[
          NavItem(
            icon: getTabIcon(0),
            title: Text("首页"),
            vsync: this,
          ),
          NavItem(
            icon: getTabIcon(1),
            title: Text("资讯"),
            vsync: this,
          ),
          NavItem(
            icon: getTabIcon(2),
            title: Text("签到"),
            vsync: this,
          ),
          NavItem(
            icon: getTabIcon(3),
            title: Text("考试"),
            vsync: this,
          ),
          NavItem(
            icon: getTabIcon(4),
            title: Text("我的"),
            vsync: this,
          ),
        ].map((NavItem navigationIconView) => navigationIconView.item).toList(),
        currentIndex: _currentIndex,
        fixedColor: Colors.red,
        //设置显示的模式
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
//            _navigationViews[_currentIndex].controller.reverse();
            _currentIndex = index;
//            _navigationViews[_currentIndex].controller.forward();
          });
        });

//双击home键退出应用程序
    int _lastClickTime = 0;
    Future<bool> doubleClickBack() {
      int nowTime = DateTime.now().microsecondsSinceEpoch;
      if (_lastClickTime != 0 && nowTime - _lastClickTime > 1500) {
        return Future.value(true);
      } else {
        _lastClickTime = new DateTime.now().microsecondsSinceEpoch;
        Future.delayed(const Duration(milliseconds: 1500), () {
          _lastClickTime = 0;
        });
        GlobalToast.showToast("再按一次后退键退出程序");
        return Future.value(false);
      }
    }

    return WillPopScope(
        child: Scaffold(
          body: Center(child: _bodys[_currentIndex]),
          bottomNavigationBar: bottomNavigationBar,
        ),
        onWillPop: doubleClickBack);
  }
}
