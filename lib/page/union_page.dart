import 'package:flutter/material.dart';
import 'package:party_build/page/union_common_page.dart';

class UnionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UnionState();
}

class UnionState extends State<UnionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "工会工作",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  "组织机构",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Row(
                  children: <Widget>[
                    _buildExpandedSquare(
                        icon: "images/ic_branch_union.png",
                        title: "分工会",
                        skipType: 0),
                    _buildExpandedSquare(
                        icon: "images/ic_union_committee.png",
                        title: "工会委员会",
                        skipType: 1),
                    _buildExpandedSquare(
                        icon: "images/ic_women_committee.png",
                        title: "女工委员会",
                        skipType: 2),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Text(
                  "企务公开",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Row(
                  children: <Widget>[
                    _buildExpandedSquare(
                        icon: "images/ic_related_system.png",
                        title: "相关制度",
                        skipType: 3),
                    _buildExpandedSquare(
                        icon: "images/ic_pub_info.png",
                        title: "公开信息",
                        skipType: 4),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Text(
                  "职代会",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            _buildExpandedRectangle(
                                title: "十届一次职代会",
                                color: Colors.blueAccent,
                                skipType: 5),
                            _buildExpandedRectangle(
                                title: "十届二次职代会",
                                color: Colors.blueAccent,
                                skipType: 6)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            _buildExpandedRectangle(
                                title: "十届三次职代会",
                                color: Colors.blueAccent,
                                skipType: 7),
                            _buildExpandedRectangle(
                                title: "十届四次职代会",
                                color: Colors.blueAccent,
                                skipType: 8)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Text(
                  "文体协会",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _buildExpandedSquare(
                              icon: "images/ic_chess.png",
                              title: "象棋协会",
                              skipType: 9),
                          _buildExpandedSquare(
                              icon: "images/ic_dance.png",
                              title: "舞蹈、瑜伽协会",
                              skipType: 10),
                          _buildExpandedSquare(
                              icon: "images/ic_tennis.png",
                              title: "台球、乒乓球协会",
                              skipType: 11),
                          _buildExpandedSquare(
                              icon: "images/ic_basketball.png",
                              title: "篮球协会",
                              skipType: 12),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _buildExpandedSquare(
                              icon: "images/ic_camera.png",
                              title: "摄影协会",
                              skipType: 13),
                          _buildExpandedSquare(
                              icon: "images/ic_badminton.png",
                              title: "网球、羽毛球协会",
                              skipType: 14),
                          _buildExpandedSquare(
                              icon: "images/ic_swimming.png",
                              title: "游泳协会",
                              skipType: 15),
                          Expanded(
                            child: Container(),
                            flex: 1,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Text(
                  "分工会活动信息",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            _buildExpandedRectangle(
                                title: "第一分工会",
                                color: Color.fromARGB(225, 0, 201, 219),
                                skipType: 16),
                            _buildExpandedRectangle(
                                title: "第二分工会",
                                color: Color.fromARGB(225, 0, 201, 219),
                                skipType: 17),
                            _buildExpandedRectangle(
                                title: "第三分工会",
                                color: Color.fromARGB(225, 0, 201, 219),
                                skipType: 18)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: <Widget>[
                            _buildExpandedRectangle(
                                title: "第四分工会",
                                color: Color.fromARGB(225, 0, 201, 219),
                                skipType: 19),
                            _buildExpandedRectangle(
                                title: "第五分工会",
                                color: Color.fromARGB(225, 0, 201, 219),
                                skipType: 20),
                            _buildExpandedRectangle(
                                title: "第六分工会",
                                color: Color.fromARGB(225, 0, 201, 219),
                                skipType: 21),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void skipPage(String title, int skipType) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UnionCommonPage(
              skipType: skipType,
              pageTitle: title,
            )));
  }

  Widget _buildExpandedSquare({String icon, String title, int skipType}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          switch (skipType) {
            case 0:
              skipPage(title, skipType);
              break;
            case 1:
              skipPage(title, skipType);
              break;
            case 2:
              skipPage(title, skipType);
              break;
            case 3:
              skipPage(title, skipType);
              break;
            case 4:
              skipPage(title, skipType);
              break;
            case 9:
              skipPage(title, skipType);
              break;
            case 10:
              skipPage(title, skipType);
              break;
            case 11:
              skipPage(title, skipType);
              break;
            case 12:
              skipPage(title, skipType);
              break;
            case 13:
              skipPage(title, skipType);
              break;
            case 14:
              skipPage(title, skipType);
              break;
            case 15:
              skipPage(title, skipType);
              break;
          }
        },
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Image.asset(
                  icon,
                  width: 50.0,
                  height: 50.0,
                ),
                padding: EdgeInsets.only(
                    left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(title),
              )
            ],
          ),
        ),
      ),
      flex: 1,
    );
  }

  Widget _buildExpandedRectangle({String title, Color color, int skipType}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          switch (skipType) {
            case 5:
              skipPage(title, skipType);
              break;
            case 6:
              skipPage(title, skipType);
              break;
            case 7:
              skipPage(title, skipType);
              break;
            case 8:
              skipPage(title, skipType);
              break;
            case 16:
              skipPage(title, skipType);
              break;
            case 17:
              skipPage(title, skipType);
              break;
            case 18:
              skipPage(title, skipType);
              break;
            case 19:
              skipPage(title, skipType);
              break;
            case 20:
              skipPage(title, skipType);
              break;
            case 21:
              skipPage(title, skipType);
              break;
          }
        },
        child: Container(
          margin: EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 15.0),
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        ),
      ),
      flex: 1,
    );
  }
}
