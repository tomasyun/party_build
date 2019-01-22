import 'package:flutter/material.dart';
import 'package:party_build/bloc/meeting_bloc.dart';
import 'package:party_build/list/meeting_list.dart';
import 'package:party_build/model/meeting_model.dart';

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
            return _buildMeetingList(data);
          },
          empty: () {},
          error: (msg) {}),
    );
  }

  Widget _buildMeetingList(Meeting meeting) {
    return MeetingList(
      meeting: meeting,
    );
  }
}
