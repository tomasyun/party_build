import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/home_model.dart';

class HomeBloc extends BlocProvider<Home> {
  void doGetHomeDataRequest() async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    Response response = await Dio(options).post("home");
    doRequest(response: response, dispose: (map) => Home.fromJson(map));
  }

  static HomeBloc newInstance = HomeBloc();
}
