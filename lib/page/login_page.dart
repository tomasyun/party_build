import 'package:flutter/material.dart';
import 'package:party_build/bloc/login_bloc.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/global/toast.dart';
import 'package:party_build/model/login_model.dart';
import 'package:party_build/tab/index.dart';

//登录
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with LoginBloc {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: new Image.asset("images/img_login.png", fit: BoxFit.fill),
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "images/app_logo.png",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      child: Text(
                        "中国能源建设集团甘肃省",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                    Container(
                      child: Text(
                        "电力设计院有限公司",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 30, top: 30, right: 30, bottom: 15),
                      child: TextField(
                        controller: userNameController,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "请输入用户名",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "请输入密码",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          contentPadding:
                              new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: RaisedButton(
                          onPressed: _login,
                          color: Colors.red,
                          child: Text(
                            "立即登录",
                            style:
                            TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                          textColor: Colors.white,
                          padding: EdgeInsets.only(
                              right: 120, left: 120, top: 15, bottom: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _login() {
    if (userNameController.text == "") {
      GlobalToast.showToast("请输入用户名");
    } else if (passwordController.text == "") {
      GlobalToast.showToast("情输入密码");
    } else {
      doLogin(userNameController.text, passwordController.text);
    }
  }

  @override
  void onSuccess(LoginModel model) {
    if (model.code == "0000") {
      GlobalToast.showToast("登录成功");
      LoginData data = model.data;
      SpUtils sp = SpUtils();
      sp.putString("name", data.name);
      sp.putString("partyPost", data.partyPost);
      sp.putString("token", "Bearer " + data.token);
      sp.putString("userId", data.userId);
      sp.putString("avatar", data.avatar);
      sp.putBool("isManager", data.isManager);
      sp.putInt("isLoginOk", 1);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Index()),
              (route) => route == null);
    } else {
      GlobalToast.showToast(model.msg);
    }
  }
}
