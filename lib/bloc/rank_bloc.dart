import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/rank_model.dart';

class RankBloc extends BlocProvider<Rank> {
  void doGetRankRequest() async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    Response response = await Dio(options).post("creditRankList");
    doRequest(response: response, dispose: (map) => Rank.fromJson(map));
  }

  static RankBloc newInstance = RankBloc();
}
