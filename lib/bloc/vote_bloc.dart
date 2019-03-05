import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/vote_model.dart';

class VoteBloc extends BlocProvider<Vote> {
  void doGetVoteListRequest() async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    print(token);
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    Response response = await Dio(options).post("voteManagerList");
    doRequest(response: response, dispose: (map) => Vote.fromJson(map));
  }

  static VoteBloc newInstance = VoteBloc();
}
