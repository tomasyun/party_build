import 'package:flutter/material.dart';
import 'package:party_build/model/union_model.dart';
import 'package:party_build/page/info_detail_page.dart';

// ignore: must_be_immutable
class UnionItem extends StatelessWidget {
  UnionModel model;

  UnionItem({this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                InfoDetailPage(
                  id: model.id,
                  receiveId: 1,
                )));
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      model.title,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            model.publishDate,
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black45),
                          ),
                          margin: EdgeInsets.only(top: 2.0),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: Text(
                            model.commentNum + "评论",
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black45),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.black12,
            )
          ],
        ),
      ),
    );
  }

}
