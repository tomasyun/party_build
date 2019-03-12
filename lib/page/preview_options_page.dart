import 'package:flutter/material.dart';
import 'package:party_build/bloc/preview_option_bloc.dart';
import 'package:party_build/item/preview_option_model.dart';

// ignore: must_be_immutable
class PreviewOptionsPage extends StatefulWidget {
  String index;
  String optionId;

  PreviewOptionsPage({this.index, this.optionId});

  @override
  State<StatefulWidget> createState() => PreviewOptionsState();
}

class PreviewOptionsState extends State<PreviewOptionsPage> {
  PreviewOptionBloc _bloc = PreviewOptionBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doPreviewOptionRequest(id: widget.optionId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "试题查看",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: _buildPreviewOptionBody(),
    );
  }

  Widget _buildPreviewOptionBody() {
    return _bloc.streamBuild(loading: () {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      );
    }, success: (data) {
      return _buildPreviewOptionContent(data);
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
    });
  }

  Widget _buildPreviewOptionContent(PreviewOption option) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.topStart,
            child: Text(
                widget.index +
                    ".  " +
                    "(" +
                    option.data.typeId +
                    ")" +
                    "   " +
                    option.data.content,
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Column(
              children: _buildOptionList(option),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text("正确答案:",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 2.0),
                  child: Text(
                    option.data.answer,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOptionItem(PreviewOptionModel model, String answer) {
    return Container(
      margin: EdgeInsets.only(left: 15.0, top: 15.0),
      child: Row(
        children: <Widget>[
          Container(
            child: _buildOptionIcon(model.isTrue, answer, model.name),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Text(
              model.name + "    " + model.content,
              style: TextStyle(fontSize: 14.0, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOptionIcon(String isTrue, String answer, String name) {
    if (isTrue == "0") {
      if (answer == name) {
        return Image.asset(
          "images/ic_right.png",
          width: 20.0,
          height: 20.0,
        );
      } else {
        return Image.asset(
          "images/ic_wrong.png",
          width: 20.0,
          height: 20.0,
        );
      }
    } else if (isTrue == "1") {
      return Image.asset(
        "images/ic_right.png",
        width: 20.0,
        height: 20.0,
      );
    } else if (isTrue == "2") {
      return Image.asset(
        "images/ic_cb_on.png",
        width: 20.0,
        height: 20.0,
      );
    } else {
      return Image.asset(
        "",
        width: 20.0,
        height: 20.0,
      );
    }
    return null;
  }

  List<Widget> _buildOptionList(PreviewOption option) {
    return option.data.questionOptionsList
        .map((item) => _buildOptionItem(item, option.data.answer))
        .toList();
  }
}
