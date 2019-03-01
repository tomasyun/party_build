import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_text.dart';
import 'package:party_build/bloc/info_detail_bloc.dart';
import 'package:party_build/model/info_detail_model.dart';

// ignore: must_be_immutable
class InfoDetailPage extends StatefulWidget {
  String id;
  int receiveId;

  InfoDetailPage({this.id, this.receiveId});

  @override
  State<StatefulWidget> createState() => InfoDetailState();
}

class InfoDetailState extends State<InfoDetailPage> {
  InfoDetailBloc _bloc = InfoDetailBloc.newInstance;

  @override
  void initState() {
    super.initState();
    switch (widget.receiveId) {
      case 0:
        _bloc.doGetInfoDetailRequest(widget.id);
        break;
      case 1:
        _bloc.doGetArticleDetailRequest(widget.id);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "资讯详情",
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
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
            return _buildDetailContent(data);
          },
          error: (msg) {
            return Container(
              child: Center(
                child: Text(msg),
              ),
            );
          },
          empty: () {}),
    );
  }

  Widget _buildDetailContent(InfoDetail detail) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  detail.data.title,
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
                        "发布单位:",
                        style: TextStyle(fontSize: 14.0, color: Colors.black45),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2.0, left: 3.0),
                      child: _buildText(
                        detail.data.publicUnit,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(detail.data.publishDate,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black45)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: HtmlText(
                  data: detail.data.content,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(String name) {
    if (name != null && name.length < 8) {
      return Text(name,
          style: TextStyle(fontSize: 14.0, color: Colors.black45));
    } else {
      return Text("-- --",
          style: TextStyle(fontSize: 14.0, color: Colors.black45));
    }
  }
}
