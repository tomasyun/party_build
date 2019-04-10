import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/info_model.dart';

class InfoBloc extends BlocProvider<Info> {
  void doInfoRequest(
      {String id, String draw, String start, String length}) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from(
        {"id": id, "draw": draw, "start": start, "length": length});
    print(data);
    Response response = await Dio(options).post("getInfo", data: data);
    doRequest(response: response, dispose: (map) => Info.fromJson(map));
  }

  static InfoBloc newInstance = InfoBloc();
//  var _api = GlobalApi();
//
//  void doRequest({Response response, Function dispose}) {
//    _api.doRequest(
//        response: response,
//        success: (map) {},
//        empty: () {},
//        error: (errorMsg) {});
//  }
}
