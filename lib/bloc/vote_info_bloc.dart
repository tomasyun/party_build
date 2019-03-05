import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/vote_info_model.dart';

class VoteInfoBloc extends BlocProvider<VoteInfo> {
  Future doGetVoteInfoRequest(String id) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    print(token);
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({"id": id});
    print(data);
    Response response = await Dio(options).post("voteBrief", data: data);
    doRequest(response: response, dispose: (map) => VoteInfo.fromJson(map));
  }

  static VoteInfoBloc newInstance = VoteInfoBloc();
}
