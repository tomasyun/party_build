import 'package:flutter/material.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/page/login_page.dart';
import 'package:party_build/tabhost/index.dart';

//启动页
class SplashPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<SplashPage> with TickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;
  var animationStateListener;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    animationStateListener = (status) {
      _judgeIsLogin(status);
    };
    _animation.addStatusListener((status) => animationStateListener(status));
    _controller.forward();
  }

//判断是否已经登录
  void _judgeIsLogin(AnimationStatus status) async {
    int isLoginOk;
    await SpUtils().getInt("isLoginOk").then((value) {
      isLoginOk = value;
    });
    if (isLoginOk == 1) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Index()),
            (route) => route == null);
      }
    } else {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => route == null);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "images/img_splash.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeStatusListener(animationStateListener);
    _controller.dispose();
    super.dispose();
  }
}
