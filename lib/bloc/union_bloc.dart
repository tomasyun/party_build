import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/union_model.dart';

class UnionBloc extends BlocProvider<Union> {
  void doGetUnionRequest(
      {String articleType,
      String childrenType,
      String draw,
      String start,
      String length}) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    print(token);
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({
      "articleType": articleType,
      "childrenType": childrenType,
      "draw": draw,
      "start": start,
      "length": length
    });
    print(data);
    Response response = await Dio(options).post("findArticle", data: data);
    doRequest(response: response, dispose: (map) => Union.fromJson(map));
  }

  static UnionBloc newInstance = UnionBloc();
}
