import 'package:flutter/material.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/global/toast.dart';
import 'package:party_build/page/pwd_page.dart';
import 'package:party_build/page/splash_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingState();
}

class SettingState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "设置",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.black12,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PasswordPage())),
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    "密码修改",
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            ),
            GestureDetector(
              onTap: _checkVersion,
              child: Container(
                margin: EdgeInsets.only(top: 1.0),
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    "版本更新",
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: RaisedButton(
                onPressed: _loginOut,
                child: Text(
                  "退出登录",
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
                color: Colors.red,
                padding: EdgeInsets.only(
                    top: 15.0, bottom: 15.0, left: 130.0, right: 130.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _loginOut() {
    NavigatorState navigator =
        context.rootAncestorStateOfType(const TypeMatcher<NavigatorState>());
    Alert(
      context: context,
      title: "退出登录?",
      desc: "退出登录可能会使你现有记录归零，确定退出?",
      style: AlertStyle(
        isCloseButton: false,
        titleStyle: TextStyle(fontSize: 18.0),
        descStyle: TextStyle(fontSize: 16.0),
      ),
      buttons: [
        DialogButton(
          height: 45.0,
          child: Text(
            "确定",
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
          color: Colors.blue[600],
          onPressed: () {
            SpUtils sp = SpUtils();
            sp.putInt("isLoginOk", 0);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => SplashPage()),
                (router) => router == null);
          },
        ),
        DialogButton(
          height: 45.0,
          child: Text(
            "取消",
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
          color: Colors.red,
          onPressed: () => navigator.pop(context),
        )
      ],
    ).show();
  }

  void _checkVersion() {
    GlobalToast.showToast("当前版本为最新版本");
  }
}
