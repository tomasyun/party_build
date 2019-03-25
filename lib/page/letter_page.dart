import 'package:flutter/material.dart';
import 'package:party_build/bloc/letter_bloc.dart';
import 'package:party_build/item/letter_item.dart';
import 'package:party_build/model/letter_model.dart';
import 'package:party_build/refresh/behavior.dart';
import 'package:party_build/refresh/header.dart';
import 'package:party_build/refresh/refresher.dart';

class LetterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LetterState();
}

class LetterState extends State<LetterPage> {
  LetterBloc _bloc = LetterBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetLetterRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "信箱",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
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
            return Center(
              child: EasyRefresh(
                key: GlobalKey<EasyRefreshState>(),
                behavior: ScrollOverBehavior(),
                refreshHeader: ClassicsHeader(
                  key: GlobalKey<RefreshHeaderState>(),
                  bgColor: Colors.transparent,
                  textColor: Colors.black87,
                  moreInfoColor: Colors.black54,
                  showMore: true,
                ),
                child: ListView(
                  children: _buildMailList(data),
                ),
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 1), () {
                    setState(() {
                      _bloc.doGetLetterRequest();
                    });
                  });
                },
              ),
            );
          },
          error: (msg) {},
          empty: () {
            return Container(
              child: Center(
                child: Text("暂无数据"),
              ),
            );
          }),
    );
  }

  List<LetterItem> _buildMailList(Letter letter) {
    return letter.data
        .map((item) => LetterItem(
              model: item,
            ))
        .toList();
  }
}
