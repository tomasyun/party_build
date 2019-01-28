import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/api/global_api.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/suggest_model.dart';

abstract class SuggestBloc {
  void doSubmitSuggestRequest(String content) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({"content": content});
    Response response = await Dio(options).post("suggestFeedback", data: data);
    doRequest(response: response, dispose: (map) => Suggest.fromJson(map));
  }

  var _api = GlobalApi();

  void doRequest({Response response, Function dispose}) {
    _api.doRequest(
        response: response,
        success: (map) {
          submitSuccess(dispose(map));
        },
        empty: () {},
        error: (errorMsg) {});
  }

  void submitSuccess(Suggest suggest);
}
