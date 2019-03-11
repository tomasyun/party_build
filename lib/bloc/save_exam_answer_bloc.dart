import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/api/global_api.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/exam_rst_model.dart';

abstract class SaveExamAnswerBloc {
  void doSaveExamAnswerRequest({String json}) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    print(token);
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    Response response = await Dio(options).post("saveExamAnswers", data: json);
    doRequest(response: response, dispose: (map) => ExamRst.fromJson(map));
  }

  GlobalApi _api = GlobalApi();

  void doRequest({Response response, Function dispose}) async {
    _api.doRequest(
        response: response,
        success: (map) => onSuccess(dispose(map)),
        error: (errorMsg) {},
        empty: () {});
  }

  void onSuccess(ExamRst model);
}
