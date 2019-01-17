import 'package:flutter/material.dart';
import 'package:party_build/page/password_page.dart';
import 'package:party_build/page/splash_page.dart';

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
                  title: Text("密码修改"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => {},
              child: Container(
                margin: EdgeInsets.only(top: 1.0),
                color: Colors.white,
                child: ListTile(
                  title: Text("版本更新"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: RaisedButton(
                onPressed: () => _loginOut,
                child: Text(
                  "退出登录",
                  style: TextStyle(color: Colors.white),
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
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SplashPage()),
        (router) => null);
  }
}
