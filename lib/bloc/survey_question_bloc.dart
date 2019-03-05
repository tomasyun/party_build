import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/survey_question_model.dart';

class SurveyQuestionBloc extends BlocProvider<SurveyQuestion> {
  void doGetSurveyQuestionRequest({String surveyId}) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    print(token);
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({"id": surveyId});
    print(data);
    Response response =
        await Dio(options).post("getQuestionSurvey", data: data);
    doRequest(
        response: response, dispose: (map) => SurveyQuestion.fromJson(map));
  }

  static SurveyQuestionBloc newInstance = SurveyQuestionBloc();
}
