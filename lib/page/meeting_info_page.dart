import 'package:flutter/material.dart';
import 'package:party_build/bloc/meeting_info_bloc.dart';
import 'package:party_build/bloc/sign_up_bloc.dart';
import 'package:party_build/global/toast.dart';
import 'package:party_build/model/meeting_info_model.dart';
import 'package:party_build/model/response_rst_model.dart';
import 'package:party_build/page/leave_reason_page.dart';
import 'package:party_build/page/meeting_summary_page.dart';
import 'package:party_build/page/success_rst_page.dart';

// ignore: must_be_immutable
class MeetingInfoPage extends StatefulWidget {
  String id;

  MeetingInfoPage({this.id});

  @override
  State<StatefulWidget> createState() => MeetingInfoState();
}

class MeetingInfoState extends State<MeetingInfoPage> with SignUpBloc {
  bool _brief = false;
  bool _participants = false;
  MeetingInfoBloc _bloc = MeetingInfoBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetMeetingInfoRequest(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "会议摘要",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: _buildMeetingInfoBody(),
      backgroundColor: Color.fromARGB(225, 245, 245, 245),
    );
  }

  Widget _buildMeetingInfoBody() {
    return _bloc.streamBuild(loading: () {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      );
    }, success: (data) {
      return _buildMeetingInfoContent(data);
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

  Widget _buildMeetingInfoContent(MeetingInfo info) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(bottom: 100.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: FadeInImage.assetNetwork(
                      placeholder: "images/app_def.png",
                      image: info.data.themeImg,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 15.0),
                    padding: EdgeInsets.all(15.0),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        _buildContainer("主题", info.data.theme),
                        Container(
                          width: double.infinity,
                          height: 1.0,
                          color: Colors.black12,
                        ),
                        _buildContainer("时间", info.data.startDate),
                        Container(
                          width: double.infinity,
                          height: 1.0,
                          color: Colors.black12,
                        ),
                        _buildContainer("地点", info.data.address),
                        Container(
                          width: double.infinity,
                          height: 1.0,
                          color: Colors.black12,
                        ),
                        _buildContainer("主讲", info.data.speaker),
                        Container(
                          width: double.infinity,
                          height: 1.0,
                          color: Colors.black12,
                        ),
                        _buildCategoryContainer("类别", info.data.category),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: _buildBriefExpansionPanelList(
                        title: "简介", content: info.data.brief),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: _buildParticipantsExpansionPanelList(
                        title: "参会人", attender: info.data.attender),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 80.0,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.black12,
              ),
              _buildBottomContainer(info.data.conferenceState, info.data.action,
                  info.data.signUpState, info.data.leaveState)
            ],
          ),
        )
      ],
    );
  }

  Widget _buildCategoryContainer(String title, String categoryId) {
    if (categoryId == "0") {
      return _buildContainer(title, "支部党员大会");
    } else if (categoryId == "1") {
      return _buildContainer(title, "支部委员会");
    } else if (categoryId == "2") {
      return _buildContainer(title, "党小组会");
    } else if (categoryId == "3") {
      return _buildContainer(title, "党课");
    } else {
      return _buildContainer(title, "");
    }
  }

  Widget _buildBottomContainer(
      conferenceStateId, String action, String signState, String leaveState) {
    if (conferenceStateId == "0") {
      switch (action) {
        case "Q":
          return _buildMeetingOnContainer(
              title: "报名",
              title2: "请假",
              color: Colors.red,
              color2: Colors.red,
              onPress: () {
                GlobalToast.showToast("报名时间未到");
              },
              onPress2: () {
                GlobalToast.showToast("当前不能请假");
              });
          break;
        case "O":
          if (signState == "0") {
            if (leaveState == "0") {
              return _buildMeetingOnContainer(
                  title: "报名",
                  title2: "请假",
                  color: Colors.red,
                  color2: Colors.red,
                  onPress: () {
                    doSignUpRequest(id: widget.id);
                  },
                  onPress2: () {
//                    Future future =
                    Future future =
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LeaveReasonPage(
                                  meetingId: widget.id,
                                )));
                    future.then((value) {
                      if (value == "2") {
                        setState(() {
                          print(value);
                          _bloc.doGetMeetingInfoRequest(id: widget.id);
                        });
                      }
                    });
                  });
            } else {
              return Container(
                height: 79.0,
                alignment: AlignmentDirectional.center,
                child: _buildRaisedButton(
                    title: "已请假",
                    edge: EdgeInsets.only(
                        left: 120, top: 15.0, right: 120.0, bottom: 15.0),
                    color: Color.fromARGB(255, 249, 125, 108),
                    onPressed: () {}),
              );
            }
          } else {
            return Container(
              height: 79.0,
              alignment: AlignmentDirectional.center,
              child: _buildRaisedButton(
                  title: "已报名",
                  edge: EdgeInsets.only(
                      left: 120, top: 15.0, right: 120.0, bottom: 15.0),
                  color: Color.fromARGB(255, 249, 125, 108),
                  onPressed: () {}),
            );
          }
          break;
        case "H":
          if (signState == "0") {
            if (leaveState == "0") {
              return _buildMeetingOnContainer(
                  title: "报名",
                  title2: "请假",
                  color: Colors.red,
                  color2: Colors.red,
                  onPress: () {
                    GlobalToast.showToast("报名时间已结束");
                  },
                  onPress2: () {
                    GlobalToast.showToast("当前不能请假");
                  });
            } else {
              return Container(
                height: 79.0,
                alignment: AlignmentDirectional.center,
                child: _buildRaisedButton(
                    title: "已请假",
                    edge: EdgeInsets.only(
                        left: 120, top: 15.0, right: 120.0, bottom: 15.0),
                    color: Color.fromARGB(255, 249, 125, 108),
                    onPressed: () {}),
              );
            }
          } else {
            return Container(
              height: 79.0,
              alignment: AlignmentDirectional.center,
              child: _buildRaisedButton(
                  title: "已报名",
                  edge: EdgeInsets.only(
                      left: 120, top: 15.0, right: 120.0, bottom: 15.0),
                  color: Color.fromARGB(255, 249, 125, 108),
                  onPressed: () {}),
            );
          }
          break;
      }
    } else if (conferenceStateId == "1") {
      switch (action) {
        case "Q":
          return _buildMeetingOnContainer(
              title: "报名",
              title2: "请假",
              color: Colors.red,
              color2: Colors.red,
              onPress: () {
                GlobalToast.showToast("报名时间未到");
              },
              onPress2: () {
                GlobalToast.showToast("当前不能请假");
              });
          break;
        case "O":
          if (signState == "0") {
            if (leaveState == "0") {
              return Container(
                height: 79.0,
                alignment: AlignmentDirectional.center,
                child: _buildRaisedButton(
                    title: "会议进行中",
                    edge: EdgeInsets.only(
                        left: 120, top: 15.0, right: 120.0, bottom: 15.0),
                    color: Color.fromARGB(255, 249, 125, 108),
                    onPressed: () {}),
              );
            } else {
              return Container(
                height: 79.0,
                alignment: AlignmentDirectional.center,
                child: _buildRaisedButton(
                    title: "已请假",
                    edge: EdgeInsets.only(
                        left: 120, top: 15.0, right: 120.0, bottom: 15.0),
                    color: Color.fromARGB(255, 249, 125, 108),
                    onPressed: () {}),
              );
            }
          } else {
            return Container(
              height: 79.0,
              alignment: AlignmentDirectional.center,
              child: _buildRaisedButton(
                  title: "已报名",
                  edge: EdgeInsets.only(
                      left: 120, top: 15.0, right: 120.0, bottom: 15.0),
                  color: Color.fromARGB(255, 249, 125, 108),
                  onPressed: () {}),
            );
          }
          break;
        case "H":
          if (signState == "0") {
            if (leaveState == "0") {
              return _buildMeetingOnContainer(
                  title: "报名",
                  title2: "请假",
                  color: Colors.red,
                  color2: Colors.red,
                  onPress: () {
                    GlobalToast.showToast("报名时间已结束");
                  },
                  onPress2: () {
                    GlobalToast.showToast("当前不能请假");
                  });
            } else {
              return Container(
                height: 79.0,
                alignment: AlignmentDirectional.center,
                child: _buildRaisedButton(
                    title: "已请假",
                    edge: EdgeInsets.only(
                        left: 120, top: 15.0, right: 120.0, bottom: 15.0),
                    color: Color.fromARGB(255, 249, 125, 108),
                    onPressed: () {}),
              );
            }
          } else {
            return Container(
              height: 79.0,
              alignment: AlignmentDirectional.center,
              child: _buildRaisedButton(
                  title: "已报名",
                  edge: EdgeInsets.only(
                      left: 120, top: 15.0, right: 120.0, bottom: 15.0),
                  color: Color.fromARGB(255, 249, 125, 108),
                  onPressed: () {}),
            );
          }
          break;
      }
    } else if (conferenceStateId == "2") {
      return _buildMeetingOkContainer();
    }
    return Container();
  }

  Widget _buildMeetingOnContainer(
      {String title,
      String title2,
      Color color,
      Color color2,
      VoidCallback onPress,
      VoidCallback onPress2}) {
    return Container(
      height: 79.0,
      alignment: AlignmentDirectional.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildRaisedButton(
              title: title,
              edge: EdgeInsets.only(
                  left: 60.0, top: 15.0, right: 60.0, bottom: 15.0),
              color: color,
              onPressed: onPress),
          _buildRaisedButton(
              title: title2,
              edge: EdgeInsets.only(
                  left: 60.0, top: 15.0, right: 60.0, bottom: 15.0),
              color: color2,
              onPressed: onPress2),
        ],
      ),
    );
  }

  Widget _buildMeetingOkContainer() {
    return Container(
      height: 79.0,
      alignment: AlignmentDirectional.center,
      child: _buildRaisedButton(
          title: "查看会议纪要",
          edge: EdgeInsets.only(
              left: 120.0, top: 15.0, right: 120.0, bottom: 15.0),
          color: Color.fromARGB(255, 249, 125, 108),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MeetingSummaryPage(
                      meetingId: widget.id,
                    )));
          }),
    );
  }

  Widget _buildRaisedButton(
      {String title,
      EdgeInsetsGeometry edge,
      Color color,
      VoidCallback onPressed}) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(fontSize: 14.0, color: Colors.white),
      ),
      padding: edge,
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
    );
  }

  Widget _buildContainer(String title, String subTitle) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 14.0, color: Colors.black45, letterSpacing: 5.0),
            ),
            margin: EdgeInsets.only(right: 30.0),
          ),
          Expanded(
            child: Container(
              child: Text(
                subTitle,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            flex: 1,
          )
        ],
      ),
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
    );
  }

  Widget _buildBriefExpansionPanelList({String title, String content}) {
    return ExpansionPanelList(
        expansionCallback: (int panelIndex, bool isExpanded) {
          setState(() {
            _brief = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                color: Colors.white,
                padding: EdgeInsets.all(15.0),
                child: Container(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black45,
                        letterSpacing: 5.0),
                  ),
                ),
              );
            },
            body: Container(
              padding: EdgeInsets.all(15.0),
              width: double.infinity,
              child: Text(
                content,
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
            ),
            isExpanded: _brief,
          ),
        ]);
  }

  Widget _buildParticipantsExpansionPanelList(
      {String title, List<dynamic> attender}) {
    return ExpansionPanelList(
        expansionCallback: (int panelIndex, bool isExpanded) {
          setState(() {
            _participants = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                color: Colors.white,
                padding: EdgeInsets.all(15.0),
                child: Container(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black45,
                        letterSpacing: 5.0),
                  ),
                ),
              );
            },
            body: Container(
              padding: EdgeInsets.all(15.0),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: ListBody(
                  children: _buildParticipantsBody(attender),
                ),
              ),
            ),
            isExpanded: _participants,
          ),
        ]);
  }

  Widget _buildParticipantsItem(String attender) {
    return Container(
      child: Text(attender),
    );
  }

  List<Widget> _buildParticipantsBody(List<dynamic> attender) {
    return attender.map((item) => _buildParticipantsItem(item)).toList();
  }

  @override
  void onSuccess(ResponseRstModel model) {
    // TODO: implement onSuccess
    //报名成功回调
    if (model.code == "0000") {
      GlobalToast.showToast(model.msg);
      Future future = Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SuccessRstPage(
                skipId: "0",
              )));
      future.then((value) {
        if (value == "0") {
          setState(() {
            _bloc.doGetMeetingInfoRequest(id: widget.id);
          });
        }
      });
    }
  }
}
