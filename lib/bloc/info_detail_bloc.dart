import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/info_detail_model.dart';

class InfoDetailBloc extends BlocProvider<InfoDetail> {
  void doGetInfoDetailRequest(String id) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    print(token);
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({"id": id});
    print(data);
    Dio dio = Dio(options);
    Response response = await dio.post("infoDetail", data: data);
    doRequest(response: response, dispose: (map) => InfoDetail.fromJson(map));
  }

  void doGetArticleDetailRequest(String id) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({"id": id});
    print(data);
    Dio dio = Dio(options);
    Response response = await dio.post("articleDetail", data: data);
    doRequest(response: response, dispose: (map) => InfoDetail.fromJson(map));
  }

  static InfoDetailBloc newInstance = InfoDetailBloc();
}
