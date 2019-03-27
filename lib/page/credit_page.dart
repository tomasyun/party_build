import 'package:flutter/material.dart';
import 'package:party_build/bloc/credit_bloc.dart';
import 'package:party_build/global/rxbus.dart';
import 'package:party_build/list/credit_list.dart';
import 'package:party_build/model/credit_model.dart';

class CreditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreditState();
}

class CreditState extends State<CreditPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  CreditBloc _bloc = CreditBloc.newInstance;
  String score = "0";

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
    _bloc.doGetCreditListRequest("0");
    _controller.addListener(() {
      switch (_controller.index) {
        case 0:
          _bloc.doGetCreditListRequest("0");
          break;
        case 1:
          _bloc.doGetCreditListRequest("1");
          break;
        case 2:
          _bloc.doGetCreditListRequest("2");
          break;
        case 3:
          _bloc.doGetCreditListRequest("3");
          break;
      }
    });
    RxBus.register<String>().listen((event) {
      if (event == "refresh") {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "积分明细",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        bottom: PreferredSize(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Text(
                              score,
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                            padding: EdgeInsets.only(bottom: 10.0),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 30.0),
                            child: Text(
                              "全部积分",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  letterSpacing: 1),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          color: Colors.red,
                          height: 70.0,
                          child: TabBar(
                            tabs: [
                              Tab(text: '全部'),
                              Tab(text: '本月'),
                              Tab(text: '本周'),
                              Tab(text: '本日')
                            ],
                            controller: _controller,
                            labelColor: Colors.white,
                            indicatorColor: Colors.red,
                            indicatorSize: TabBarIndicatorSize.label,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            preferredSize: Size(double.infinity, 200)),
      ),
      body: TabBarView(
        children: <Widget>[
          Center(child: _buildCreditList()),
          Center(child: _buildCreditList()),
          Center(child: _buildCreditList()),
          Center(child: _buildCreditList()),
        ],
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget _buildCreditListView(Credit credit) {
    return CreditList(
      credit: credit,
    );
  }

  void initScore(Credit credit) {
    score = credit.data.totalScore.toString();
  }

  Widget _buildCreditList() {
    return _bloc.streamBuild(
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
          initScore(data);
          return _buildCreditListView(data);
        },
        error: (msg) {},
        empty: () {
          return Container(
            child: Center(
              child: Text("暂无数据"),
            ),
          );
        },
        finished: () {
          RxBus.post("refresh");
        });
  }

  @override
  void dispose() {
    super.dispose();
    RxBus.destroy();
  }
}
