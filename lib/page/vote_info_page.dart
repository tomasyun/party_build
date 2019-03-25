import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:party_build/bloc/save_vote_answer_bloc.dart';
import 'package:party_build/bloc/vote_info_bloc.dart';
import 'package:party_build/global/toast.dart';
import 'package:party_build/model/response_rst_model.dart';
import 'package:party_build/model/vote_info_model.dart';
import 'package:party_build/model/vote_sub_model.dart';

// ignore: must_be_immutable
class VoteInfoPage extends StatefulWidget {
  String id;
  String isVoter;

  VoteInfoPage({this.id, this.isVoter});

  @override
  State<StatefulWidget> createState() => VoteInfoState();
}

class VoteInfoState extends State<VoteInfoPage> with SaveVoteAnswerBloc {
  VoteInfoBloc _bloc = VoteInfoBloc.newInstance;
  int groupValue;
  List<String> optionIds;

  @override
  void initState() {
    optionIds = List<String>();
    super.initState();
    _bloc.doGetVoteInfoRequest(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        title: Text(
          "投票详情",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
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
            return _buildStack(data);
          },
          error: (msg) {
            return Container(
              child: Center(
                child: Text("暂无数据"),
              ),
            );
          },
          empty: () {}),
    );
  }

  Widget _buildStack(VoteInfo info) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      info.data.title,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text("截止日期:",
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 14.0)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3.0, left: 10.0),
                          child: Text(info.data.limitDate,
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 14.0)),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  child: Text("投票类型:",
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 14.0)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5.0),
                                  child: _buildVoteTypeText(info.data.voteType),
                                )
                              ],
                            ),
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      info.data.description == null
                          ? ""
                          : info.data.description,
                      style: TextStyle(fontSize: 14.0, color: Colors.red[900]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 30.0,
                      bottom: 30.0,
                    ),
                    width: double.infinity,
                    child: Column(
                      children: _buildRadioList(info.data, widget.isVoter),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
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
              Container(
                height: 79.0,
                alignment: AlignmentDirectional.center,
                child: _buildRaisedButton(widget.isVoter, info.data),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildVoteTypeText(String type) {
    if (type == "0") {
      return Text("多选", style: TextStyle(color: Colors.red, fontSize: 13.0));
    } else {
      return Text("单选", style: TextStyle(color: Colors.red, fontSize: 13.0));
    }
  }

  Widget _buildRaisedButton(String isVoter, VoteInfoData info) {
    if (isVoter == "1") {
      return RaisedButton(
        onPressed: () {},
        child: Text(
          "已投票",
          style: TextStyle(fontSize: 14.0, color: Colors.white),
        ),
        padding:
        EdgeInsets.only(left: 130.0, top: 15.0, bottom: 15.0, right: 130.0),
        color: Colors.deepOrange[100],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
      );
    } else {
      if (DateTime.now().isAfter(DateTime.parse(info.limitDate))) {
        return RaisedButton(
          onPressed: () {},
          child: Text(
            "已过期",
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
          padding: EdgeInsets.only(
              left: 130.0, top: 15.0, bottom: 15.0, right: 130.0),
          color: Colors.deepOrange[100],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
        );
      } else {
        return RaisedButton(
          onPressed: () {
            if (optionIds.length == 0) {
              GlobalToast.showToast("请选择");
            } else {
              VoteSubModel sub = VoteSubModel(widget.id, optionIds);
              doSaveVoteAnswerRequest(json: json.encode(sub));
            }
          },
          child: Text(
            "提交",
            style: TextStyle(fontSize: 14.0, color: Colors.white),
          ),
          padding: EdgeInsets.only(
              left: 130.0, top: 15.0, bottom: 15.0, right: 130.0),
          color: Colors.red,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
        );
      }
    }
  }

  List<RadioListTile> _buildRadioList(VoteInfoData data, String isVoter) {
    var _list = List<RadioListTile>();
    for (int j = 0; j < data.options.length; j++) {
      if (isVoter == "1") {
        if (data.options[j].isVote == "0") {
          var _item = _buildRadio(j, groupValue, data);
          _list.add(_item);
        } else {
          var _item = _buildRadio(j, j, data);
          _list.add(_item);
        }
      } else {
        if (DateTime.now().isAfter(DateTime.parse(data.limitDate))) {
          var _item = _buildRadio(j, groupValue, data);
          _list.add(_item);
        } else {
          var _item = RadioListTile(
            value: j,
            groupValue: groupValue,
            activeColor: Colors.red,
            title: Text(
              data.options[j].option,
              style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 51, 51, 51),
                  fontWeight: FontWeight.bold),
            ),
            onChanged: (T) {
              updateChanged(T);
              optionIds.add(data.options[T].id);
            },
          );
          _list.add(_item);
        }
      }
    }
    return _list;
  }

  Widget _buildRadio(int value, int group, VoteInfoData data) {
    return RadioListTile(
      value: value,
      subtitle: Container(
        margin: EdgeInsets.only(left: 15.0, top: 5.0),
        child: Text(
          data.options[value].votes + "  票",
          style:
          TextStyle(fontSize: 14, color: Color.fromARGB(255, 246, 37, 12)),
        ),
      ),
      groupValue: group,
      activeColor: Colors.red,
      title: Text(
        data.options[value].option,
        style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 51, 51, 51),
            fontWeight: FontWeight.bold),
      ),
      onChanged: (T){},
    );
  }

  void updateChanged(int value) {
    setState(() {
      groupValue = value;
    });
  }

  @override
  void onSuccess(ResponseRstModel model) {
    if (model.code == "0000") {
      setState(() {
        widget.isVoter = "1";
        _bloc.doGetVoteInfoRequest(widget.id);
      });
    }
  }
}
