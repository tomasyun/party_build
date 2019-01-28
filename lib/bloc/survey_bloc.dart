import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/survey_model.dart';

class SurveyBloc extends BlocProvider<Survey> {
  void doSurveyQuestion() async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    Response response = await Dio(options).post("questionSurveyList");
    doRequest(response: response, dispose: (map) => Survey.fromJson(map));
  }

  static SurveyBloc newInstance = SurveyBloc();
}
