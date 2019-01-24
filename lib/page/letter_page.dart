import 'package:flutter/material.dart';
import 'package:party_build/bloc/letter_bloc.dart';
import 'package:party_build/list/letter_list.dart';
import 'package:party_build/model/letter_model.dart';

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
            return _buildLetterListView(data);
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

  Widget _buildLetterListView(Letter letter) {
    return LetterList(
      letter: letter,
    );
  }
}
