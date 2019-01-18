import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/global/sharedpreferences.dart';

class InfoBloc {
  void doInfoRequest(
      {String id, String draw, String start, String length}) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from(
        {"id": id, "draw": draw, "start": start, "length": length});
    Response response = await Dio(options).post("getInfo", data: data);
  }
}
