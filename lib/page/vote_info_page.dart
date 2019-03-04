import 'package:flutter/material.dart';
import 'package:party_build/bloc/vote_info_bloc.dart';
import 'package:party_build/global/toast.dart';
import 'package:party_build/model/vote_info_model.dart';

// ignore: must_be_immutable
class VoteInfoPage extends StatefulWidget {
  String id;

  VoteInfoPage({this.id});

  @override
  State<StatefulWidget> createState() => VoteInfoState();
}

class VoteInfoState extends State<VoteInfoPage> {
  VoteInfoBloc _bloc = VoteInfoBloc.newInstance;
  int groupValue;

  @override
  void initState() {
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
                      "补充党支部组织委员,选举一名任命",
                      style: TextStyle(fontSize: 14.0, color: Colors.red),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 30.0,
                      bottom: 30.0,
                    ),
                    width: double.infinity,
                    child: Column(
                      children: _buildRadioList(info.data),
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
                child: RaisedButton(
                  onPressed: () {
                    GlobalToast.showToast("提交成功");
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
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildVoteTypeText(String type) {
    if (type == "0") {
      return Text("单选", style: TextStyle(color: Colors.red, fontSize: 14.0));
    } else {
      return Text("多选", style: TextStyle(color: Colors.red, fontSize: 14.0));
    }
  }

  List<RadioListTile> _buildRadioList(VoteInfoData data) {
    List<RadioListTile> _list = List<RadioListTile>();
    for (int j = 0; j < data.options.length; j++) {
      var _item = RadioListTile(
          value: j,
          groupValue: groupValue,
          title: Text(data.options[j].option),
          onChanged: (T) {
            updateChanged(T);
          });

      _list.add(_item);
    }
    return _list;
  }

  void updateChanged(int value) {
    setState(() {
      groupValue = value;
    });
  }
}
