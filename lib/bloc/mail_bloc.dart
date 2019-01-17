import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/api/global_api.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/leaders_model.dart';

abstract class MailBloc {
  var _api = GlobalApi();

  void doGetLeaders() async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    Response response = await Dio(options).post("leaderList");
    doRequest(response, (map) => Leaders.fromJson(map));
  }

  void doRequest(Response response, Function dispose) {
    _api.doRequest(
        response: response,
        success: (map) {
          onSuccess(dispose(map));
        },
        error: (errorMsg) => {},
        empty: () => {});
  }

  void onSuccess(Leaders leaders);
}
