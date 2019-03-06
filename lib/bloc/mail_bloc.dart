import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/api/global_api.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/leaders_model.dart';
import 'package:party_build/model/response_rst_model.dart';

abstract class MailBloc {
  var _api = GlobalApi();

  void doGetLeaders() async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    print(token);
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

  void doSendFeedbackRequest({String content}) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    print(token);
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({"content": content});
    print(data);
    Response response = await Dio(options).post("suggestFeedback", data: data);
    doSendRequest(
        response: response, dispose: (map) => ResponseRstModel.fromJson(map));
  }

  void onSendSuccess(ResponseRstModel model);

  void doSendRequest({Response response, Function dispose}) async {
    _api.doRequest(
        response: response,
        success: (map) => onSendSuccess(dispose(map)),
        error: (errorMsg) {},
        empty: () {});
  }
}
