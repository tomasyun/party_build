import 'package:flutter/material.dart';
import 'package:party_build/bloc/notice_bloc.dart';
import 'package:party_build/bloc/union_bloc.dart';
import 'package:party_build/item/notice_item.dart';
import 'package:party_build/item/union_item.dart';
import 'package:party_build/model/notice_model.dart';
import 'package:party_build/model/union_model.dart';
import 'package:party_build/refresh/behavior.dart';
import 'package:party_build/refresh/footer.dart';
import 'package:party_build/refresh/header.dart';
import 'package:party_build/refresh/refresher.dart';

class BranchParksPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BranchParksState();
}

class BranchParksState extends State<BranchParksPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  NoticeBloc _noticeBloc = NoticeBloc.newInstance;
  UnionBloc _unionBloc = UnionBloc.newInstance;
  String start = "0";
  List<NoticeModel> noticeModels;
  List<UnionModel> unionModels;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
    _noticeBloc.doGetNoticeRequest(
        title: "",
        type: "3",
        draw: "0",
        start: start,
        length: "10");
    _controller.addListener(() {
      start = "0";
      if (_controller.indexIsChanging) {
        if (_controller.index == 0) {
          _noticeBloc.doGetNoticeRequest(
              title: "",
              type: "3",
              draw: "0",
              start: start,
              length: "10");
        } else {
          _unionBloc.doGetUnionRequest(
              articleType: "15",
              childrenType: (_controller.index + 31).toString(),
              draw: "0",
              start: start,
              length: "10");
        }
      }
    });
    noticeModels = List<NoticeModel>();
    unionModels = List<UnionModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "支部园地",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: "公告通知",
            ),
            Tab(
              text: "支部活动",
            ),
            Tab(
              text: "发展党员",
            ),
            Tab(
              text: "各种台账",
            )
          ],
          labelColor: Colors.white,
          indicatorColor: Colors.red,
          controller: _controller,
        ),
      ),
      body: Center(
        child: TabBarView(
          children: [
            _buildNoticeList(),
            _buildUnionList(),
            _buildUnionList(),
            _buildUnionList(),
          ],
          controller: _controller,
          physics: NeverScrollableScrollPhysics(), //禁止滑动
        ),
      ),
    );
  }

  List<NoticeItem> _buildNoticeListView(Notice notice) {
    if (start == "0") {
      noticeModels = notice.data;
      return noticeModels
          .map((item) =>
          NoticeItem(
            model: item,
          ))
          .toList();
    } else {
      noticeModels.addAll(notice.data);
      return noticeModels
          .map((item) =>
          NoticeItem(
            model: item,
          ))
          .toList();
    }
  }

  List<UnionItem> _buildUnionListView(Union union) {
    if (start == "0") {
      unionModels = union.data.data;
      return unionModels
          .map((item) =>
          UnionItem(
            model: item,
          ))
          .toList();
    } else {
      unionModels.addAll(union.data.data);
      return unionModels
          .map((item) =>
          UnionItem(
            model: item,
          ))
          .toList();
    }
  }

  Widget _buildNoticeList() {
    return _noticeBloc.streamBuild(loading: () {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      );
    }, success: (data) {
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
          refreshFooter: ClassicsFooter(
            key: GlobalKey<RefreshFooterState>(),
            bgColor: Colors.transparent,
            textColor: Colors.black87,
            moreInfoColor: Colors.black54,
            showMore: true,
          ),
          child: ListView(
            children: _buildNoticeListView(data),
          ),
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1), () {
              start = "0";
              _noticeBloc.doGetNoticeRequest(
                  title: "",
                  type: "3",
                  draw: "0",
                  start: start,
                  length: "10");
            });
          },
          loadMore: () async {
            await Future.delayed(const Duration(seconds: 1), () {
              start = (int.parse(start) + 10).toString();
              _noticeBloc.doGetNoticeRequest(
                  title: "",
                  type: "3",
                  draw: "0",
                  start: start,
                  length: "10");
            });
          },
        ),
      );
    }, empty: () {
      return Container(
        child: Center(
          child: Text("暂无数据"),
        ),
      );
    }, error: (msg) {
      return Container(
        child: Center(
          child: Text(msg),
        ),
      );
    });
  }

  Widget _buildUnionList() {
    return _unionBloc.streamBuild(loading: () {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      );
    }, success: (data) {
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
          refreshFooter: ClassicsFooter(
            key: GlobalKey<RefreshFooterState>(),
            bgColor: Colors.transparent,
            textColor: Colors.black87,
            moreInfoColor: Colors.black54,
            showMore: true,
          ),
          child: ListView(
            children: _buildUnionListView(data),
          ),
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1), () {
              start = "0";
              _unionBloc.doGetUnionRequest(
                  articleType: "15",
                  childrenType: (_controller.index + 31).toString(),
                  draw: "0",
                  start: start,
                  length: "10");
            });
          },
          loadMore: () async {
            await Future.delayed(const Duration(seconds: 1), () {
              start = (int.parse(start) + 10).toString();
              _unionBloc.doGetUnionRequest(
                  articleType: "15",
                  childrenType: (_controller.index + 31).toString(),
                  draw: "0",
                  start: start,
                  length: "10");
            });
          },
        ),
      );
    }, empty: () {
      return Container(
        child: Center(
          child: Text("暂无数据"),
        ),
      );
    }, error: (msg) {
      return Container(
        child: Center(
          child: Text(msg),
        ),
      );
    });
  }
}
