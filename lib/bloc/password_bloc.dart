import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/password_model.dart';

class PasswordBloc extends BlocProvider<PasswordModel> {
  doSubmit(String oldPassword, String newPassword) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data =
        FormData.from({"oldPassword": oldPassword, "newPassword": newPassword});
    Response response = await Dio(options).post("updatePassword", data: data);
    doRequest(
        response: response, dispose: (map) => PasswordModel.fromJson(map));
  }

  static PasswordBloc newInstance = PasswordBloc();
//
//  var _api = GlobalApi();
//
//  void doRequest({Response response, Function dispose}) {
//    _api.doRequest(
//        response: response,
//        success: (map) => onSuccess(dispose(map)),
//        error: (errorMsg) {},
//        empty: () {});
//  }
//
//  void onSuccess(PasswordModel model);
}
