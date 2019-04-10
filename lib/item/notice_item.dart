import 'package:flutter/material.dart';
import 'package:party_build/api/global_api.dart';
import 'package:party_build/model/notice_model.dart';
import 'package:party_build/page/notice_info_page.dart';

// ignore: must_be_immutable
class NoticeItem extends StatelessWidget {
  NoticeModel model;

  NoticeItem({this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoticeInfoPage(id: model.id)));
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: FadeInImage.assetNetwork(
                          placeholder: "images/ic_avatar.png",
                          image:
                              GlobalApi().doFormatImageUrl(url: model.avatar),
                          fit: BoxFit.fill,
                          width: 40.0,
                          height: 40.0,
                        )),
                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          child: Text(
                            model.name,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              doDataFunction(model.publishDate),
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 13.0, color: Colors.black45),
                            ),
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10.0, left: 50.0),
                    child: Text(
                      model.content,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.black45,
                        letterSpacing: 0.8,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.all(15.0),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }

  String doDataFunction(String data) {
    if (data != null && data != "") {
      DateTime time = DateTime.parse(data);
      if (time.isBefore(DateTime.now())) {
        Duration duration = DateTime.now().difference(time);
        if (duration.inDays > 1) {
          return duration.inDays.toString() + "天前";
        } else if (duration.inHours > 1) {
          return duration.inHours.toString() + "小时前";
        } else {
          return duration.inMilliseconds.toString() + "分钟前";
        }
      }
    }
    return "";
  }
}
