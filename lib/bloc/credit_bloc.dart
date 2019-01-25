import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/credit_model.dart';

class CreditBloc extends BlocProvider<Credit> {
  void doGetCreditListRequest(String id) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({"id": id});
    Response response = await Dio(options).post("creditInfoList", data: data);
    doRequest(response: response, dispose: (map) => Credit.fromJson(map));
  }

  static CreditBloc newInstance = CreditBloc();
}
