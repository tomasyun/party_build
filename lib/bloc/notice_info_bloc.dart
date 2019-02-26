import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/notice_info_model.dart';

class NoticeInfoBloc extends BlocProvider<NoticeInfo> {
  Future doGetNoticeInfoRequest({String id}) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({"id": id});
    Response response = await Dio(options).post("noticeInfo", data: data);
    doRequest(response: response, dispose: (map) => NoticeInfo.fromJson(map));
  }

  static NoticeInfoBloc newInstance = NoticeInfoBloc();
}
