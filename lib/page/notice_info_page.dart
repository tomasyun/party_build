import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_text.dart';
import 'package:party_build/bloc/notice_info_bloc.dart';
import 'package:party_build/model/notice_info_model.dart';

// ignore: must_be_immutable
class NoticeInfoPage extends StatefulWidget {
  String id;

  NoticeInfoPage({this.id});

  @override
  State<StatefulWidget> createState() => NoticeInfoState();
}

class NoticeInfoState extends State<NoticeInfoPage> {
  NoticeInfoBloc _bloc = NoticeInfoBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetNoticeInfoRequest(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "通知详情",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: _bloc.streamBuild(loading: () {
        return Container(
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
          ),
        );
      }, success: (data) {
        return _buildContainer(data);
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
      }),
    );
  }

  Widget _buildContainer(NoticeInfo info) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  info.data.title,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "发布人:",
                        style: TextStyle(fontSize: 14.0, color: Colors.black45),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2.0, left: 3.0),
                      child: _buildText(
                        info.data.name,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(info.data.publishDate,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black45)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: HtmlText(
                  data: info.data.content,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(String name) {
    if (name != null && name.length < 5) {
      return Text(name,
          style: TextStyle(fontSize: 14.0, color: Colors.black45));
    } else {
      return Text("-- --",
          style: TextStyle(fontSize: 14.0, color: Colors.black45));
    }
  }
}
