import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/api/global_api.dart';
import 'package:party_build/model/login_model.dart';

abstract class LoginBloc {
  void doLogin(String username, String password) async {
//    FormData data = FormData.from({"username": username, "password": password});
    Response response = await Dio(Options(baseUrl: BASE_URL)).post(
        "auth/mobileLogin",
        data: {"username": username, "password": password});
    doRequest(response: response, dispose: (map) => LoginModel.fromJson(map));
  }

  GlobalApi _api = GlobalApi();

  void doRequest({Response response, Function dispose}) async {
    _api.doRequest(
        response: response,
        success: (map) => onSuccess(dispose(map)),
        error: (errorMsg) {},
        empty: () {});
  }

  void onSuccess(LoginModel model);
}
