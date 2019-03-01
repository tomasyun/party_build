import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/base_info_model.dart';

class BaseInfoBloc extends BlocProvider<BaseInfo> {
  void doGetBaseInfoRequest() async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    Response response = await Dio(options).post("basicInfo");
    doRequest(response: response, dispose: (map) => BaseInfo.fromJson(map));
  }

  static BaseInfoBloc newInstance = BaseInfoBloc();
}
