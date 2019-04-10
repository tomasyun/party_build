import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/notice_model.dart';

class NoticeBloc extends BlocProvider<Notice> {
  void doGetNoticeRequest(
      {String title,
      String type,
      String draw,
      String start,
      String length}) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({
      "title": title,
      "type": type,
      "draw": draw,
      "start": start,
      "length": length
    });
    Response response = await Dio(options).post("noticeByType", data: data);
    doRequest(response: response, dispose: (map) => Notice.fromJson(map));
  }

  static NoticeBloc newInstance = NoticeBloc();
}
