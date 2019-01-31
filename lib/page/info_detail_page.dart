import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:party_build/bloc/info_detail_bloc.dart';
import 'package:party_build/model/info_detail_model.dart';

// ignore: must_be_immutable
class InfoDetailPage extends StatefulWidget {
  String id;

  InfoDetailPage({this.id});

  @override
  State<StatefulWidget> createState() => InfoDetailState();
}

class InfoDetailState extends State<InfoDetailPage> {
  InfoDetailBloc _bloc = InfoDetailBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetInfoDetailRequest(widget.id);
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
    return Container(
      child: HtmlView(
        data: detail.data.content,
        stylingOptions: null,
      ),
    );
//    return
//       Container(
//        child: Column(
//          children: <Widget>[
//            Container(
//              child: Text(detail.data.title),
//            ),
//            Container(
//              child: Row(
//                children: <Widget>[
//                  Container(
//                    child: Text("来源"),
//                  ),
//                  Container(
//                    child: Text("新华网"),
//                  ),
//                  Container(
//                    child: Text(detail.data.publishDate),
//                  )
//                ],
//              ),
//            ),
//             Container(
//              child:  HtmlView(
//                data: detail.data.content,
//                stylingOptions: null,
//              ),
//            ),
//          ],
//        ),
//      );
  }
}
