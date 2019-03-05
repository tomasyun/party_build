import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_text.dart';
import 'package:party_build/bloc/meeting_summary_bloc.dart';
import 'package:party_build/model/meeting_summary_model.dart';

// ignore: must_be_immutable
class MeetingSummaryPage extends StatefulWidget {
  String meetingId;

  MeetingSummaryPage({this.meetingId});

  @override
  State<StatefulWidget> createState() => MeetingSummaryState();
}

class MeetingSummaryState extends State<MeetingSummaryPage> {
  MeetingSummaryBloc _bloc = MeetingSummaryBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetMeetingSummaryRequest(id: widget.meetingId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "会议纪要",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: _buildMeetingSummaryBody(),
    );
  }

  Widget _buildMeetingSummaryBody() {
    return _bloc.streamBuild(loading: () {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      );
    }, success: (data) {
      return _buildMeetingSummaryContent(data);
    }, empty: () {
      return Container(
        child: Center(
          child: Text("暂无数据"),
        ),
      );
    }, error: (msg) {
      return Container(
        child: Center(
          child: Text(msg),
        ),
      );
    });
  }

  Widget _buildMeetingSummaryContent(MeetingSummary summary) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              summary.data.title,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: _buildMeetingCategoryText(summary.data.category),
                  padding: EdgeInsets.only(
                      left: 5.0, top: 2.0, right: 5.0, bottom: 2.0),
                  color: Colors.orange,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Text(
                    summary.data.speaker,
                    style: TextStyle(fontSize: 14.0, color: Colors.black45),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Text(summary.data.endDate,
                      style: TextStyle(fontSize: 14.0, color: Colors.black45)),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: HtmlText(
              data: summary.data.summary,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMeetingCategoryText(String categoryId) {
    if (categoryId == "0") {
      return Text(
        "支部党员大会",
        style: TextStyle(fontSize: 14.0, color: Colors.white),
      );
    } else if (categoryId == "1") {
      return Text(
        "支部委员会",
        style: TextStyle(fontSize: 14.0, color: Colors.white),
      );
    } else if (categoryId == "2") {
      return Text(
        "党小组会",
        style: TextStyle(fontSize: 14.0, color: Colors.white),
      );
    } else if (categoryId == "3") {
      return Text(
        "党课",
        style: TextStyle(fontSize: 14.0, color: Colors.white),
      );
    } else {
      return Container();
    }
  }
}
