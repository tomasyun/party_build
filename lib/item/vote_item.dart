import 'package:flutter/material.dart';
import 'package:party_build/model/vote_model.dart';
import 'package:party_build/page/vote_info_page.dart';

// ignore: must_be_immutable
class VoteItem extends StatelessWidget {
  VoteModel model;

  VoteItem({this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      model.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  model.limitDate,
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 14.0),
                                ),
                                margin: EdgeInsets.only(top: 3.0),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "投票截止",
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "参与人数:",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 14.0),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10.0, top: 3.0),
                                  child: Text(
                                    model.voterNum,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 14.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                          flex: 1,
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
      onTap: () {
        skipVoteInfo(context, model.id, model.isVoter);
      },
    );
  }

  void skipVoteInfo(BuildContext context, String id, String isVoter) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => VoteInfoPage(
              id: id,
              isVoter: isVoter,
            )));
  }
}
