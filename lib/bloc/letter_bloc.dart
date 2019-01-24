import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/letter_model.dart';

class LetterBloc extends BlocProvider<Letter> {
  void doGetLetterRequest() async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    Response response = await Dio(options).post("mailboxList");
    doRequest(response: response, dispose: (map) => Letter.fromJson(map));
  }

  static LetterBloc newInstance = LetterBloc();
}
