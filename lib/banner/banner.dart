import 'dart:async';

import 'package:flutter/material.dart';
import 'package:party_build/banner/banner_item.dart';

const CountMax = 0x7fffffff;

typedef void OnBannerPress(int position, BannerItem item);
typedef Widget Build(int position, BannerItem item);

class BannerWidget extends StatefulWidget {
  final OnBannerPress bannerPress;
  final Build build;
  final List<BannerItem> entity; //数据
  final int height; // 高度
  final int delayTime; // 时间 (毫秒)
  final int duration; // pageView切换速度 (毫秒)

  BannerWidget(
      {Key key,
      @required this.entity,
      this.height = 180,
      this.delayTime = 1500,
      this.duration = 1500,
      this.bannerPress,
      this.build})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => BannerState();
}

class BannerState extends State<BannerWidget> {
  Timer timer;

  int selectIndex = 0;

  PageController controller;

  @override
  void initState() {
    double current = (CountMax / 2) - ((CountMax / 2) % widget.entity.length);
    controller = PageController(initialPage: current.toInt());
    start();
    super.initState();
  }

  void start() {
    stop();
    timer = Timer.periodic(Duration(milliseconds: widget.delayTime), (timer) {
      controller.animateToPage(controller.page.toInt() + 1,
          duration: Duration(milliseconds: widget.duration),
          curve: Curves.linear);
    });
  }

  void stop() {
    timer?.cancel();
    timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height.toDouble(),
        color: Colors.black12,
        child: Stack(
          children: <Widget>[
            viewPager(),
            tips(),
          ],
        ));
  }

  Widget viewPager() {
    return PageView.builder(
      itemCount: CountMax,
      controller: controller,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              if (widget.bannerPress != null) {
                widget.bannerPress(selectIndex, widget.entity[selectIndex]);
              }
            },
            child: widget.build == null
                ? FadeInImage.assetNetwork(
//                    placeholder: kTransparentImage,
                    placeholder: "images/app_def.png",
                    image: widget.entity[index % widget.entity.length].bUrl,
                    fit: BoxFit.fill)
                : widget.build(
                    index, widget.entity[index % widget.entity.length]));
      },
    );
  }

  Widget tips() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 32.0,
          padding: EdgeInsets.all(6.0),
          color: Colors.black45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(widget.entity[selectIndex].bTitle,
                    style: new TextStyle(color: Colors.white)),
                flex: 1,
              ),
              Row(children: circle())
            ],
          ),
        ));
  }

  List<Widget> circle() {
    List<Widget> circle = [];
    for (var i = 0; i < widget.entity.length; i++) {
      circle.add(Container(
        margin: EdgeInsets.all(2.0),
        width: 8.0,
        height: 8.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: selectIndex == i ? Colors.blue : Colors.white,
        ),
      ));
    }
    return circle;
  }

  onPageChanged(index) {
    selectIndex = index % widget.entity.length;
    setState(() {});
  }

  @override
  void dispose() {
    stop();
    controller?.dispose();
    super.dispose();
  }
}
