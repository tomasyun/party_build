import 'package:flutter/material.dart';
import 'package:party_build/page/studies_rst_page.dart';

class StudiesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StudiesState();
}

class StudiesState extends State<StudiesPage> {
  bool _isExpandedTask = false;
  bool _isExpandedCourse = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "学习任务",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black12,
          child: Column(
            children: <Widget>[
              Container(
                child: ExpansionPanelList(
                    expansionCallback: (int panelIndex, bool isExpanded) {
                      setState(() {
                        _isExpandedTask = !isExpanded;
                      });
                    },
                    children: [
                      ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(15.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 6.0,
                                    height: 20.0,
                                    color: Colors.red,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      "任务内容",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          body: Container(
                            padding: EdgeInsets.all(15.0),
                            width: double.infinity,
                            child: Text(
                              "陕西缔科网络科技有限公司",
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black),
                            ),
                          ),
                          isExpanded: _isExpandedTask),
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: ExpansionPanelList(
                  expansionCallback: (int panelIndex, bool isExpanded) {
                    setState(() {
                      _isExpandedCourse = !isExpanded;
                    });
                  },
                  children: [
                    ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 6.0,
                                  height: 20.0,
                                  color: Colors.red,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    "学习课件",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        body: new Container(
                          padding: EdgeInsets.all(15.0),
                          width: double.infinity,
                          child: Text(
                            "陕西缔科网络科技有限公司",
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black),
                          ),
                        ),
                        isExpanded: _isExpandedCourse),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => StudiesRslPage())),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  color: Colors.white,
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 6.0,
                        height: 20.0,
                        color: Colors.red,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: Text(
                          "学习成果",
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: Icon(Icons.keyboard_arrow_right),
                              margin: EdgeInsets.only(right: 10.0),
                            ),
                          ],
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
