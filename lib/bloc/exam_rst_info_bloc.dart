import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/exam_rst_info_model.dart';

class ExamRstInfoBloc extends BlocProvider<ExamRstInfo> {
  void doGetExamRstInfoRequest({String ruleId}) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({"ruleId": ruleId});
    print(data);
    Response response =
        await Dio(options).post("getExamAnswersRecord", data: data);
    doRequest(response: response, dispose: (map) => ExamRstInfo.fromJson(map));
  }

  static ExamRstInfoBloc newInstance = ExamRstInfoBloc();
}
