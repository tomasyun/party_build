import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/sign_info_model.dart';

class SignInfoBloc extends BlocProvider<SignInfo> {
  void doGetSignInfoRequest() async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    Response response = await Dio(options).post("getSignIn");
    doRequest(response: response, dispose: (map) => SignInfo.fromJson(map));
  }

  static SignInfoBloc newInstance = SignInfoBloc();
}
