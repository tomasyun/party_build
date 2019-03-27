import 'package:flutter/material.dart';
import 'package:party_build/bloc/meeting_bloc.dart';
import 'package:party_build/item/meeting_item.dart';
import 'package:party_build/model/meeting_model.dart';
import 'package:party_build/refresh/behavior.dart';
import 'package:party_build/refresh/header.dart';
import 'package:party_build/refresh/refresher.dart';

//三会一课
class MeetingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MeetingState();
}

class MeetingState extends State<MeetingPage> {
  MeetingBloc _bloc = MeetingBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetMeetingList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "三会一课",
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: _bloc.streamBuild(
          loading: () {
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                ),
              ),
            );
          },
          success: (data) {
            return _buildStateView(data);
          },
          empty: () {
            return Container(
              child: Center(
                child: Text("暂无数据"),
              ),
            );
          },
          error: (msg) {}),
    );
  }

  List<MeetingItem> _buildMeetingList(Meeting meeting) {
    return meeting.data
        .map((item) => MeetingItem(
              data: item,
            ))
        .toList();
  }

  Widget _buildStateView(Meeting meeting) {
    if (meeting.code == "0000") {
      if (meeting.data != null && meeting.data.isNotEmpty) {
        return Center(
          child: EasyRefresh(
            key: GlobalKey<EasyRefreshState>(),
            behavior: ScrollOverBehavior(),
            refreshHeader: ClassicsHeader(
              key: GlobalKey<RefreshHeaderState>(),
              bgColor: Colors.transparent,
              textColor: Colors.black87,
              moreInfoColor: Colors.black54,
              showMore: true,
            ),
            child: ListView(
              children: _buildMeetingList(meeting),
            ),
            onRefresh: () async {
              await new Future.delayed(const Duration(seconds: 1), () {
                setState(() {
                  _bloc.doGetMeetingList();
                });
              });
            },
          ),
        );
      } else {
        return Container(
          child: Center(
            child: Text("暂无数据"),
          ),
        );
      }
    } else {
      return Container(
        width: 0.0,
        height: 0.0,
      );
    }
  }
}
