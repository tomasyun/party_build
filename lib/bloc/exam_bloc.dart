import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/exam_model.dart';

class ExamBloc extends BlocProvider<ExamModel> {
  void doGetExam({String type}) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    print(token);
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({"type": type});
    print(data);
    Response response = await Dio(options).post("examList", data: data);
    doRequest(response: response, dispose: (map) => ExamModel.fromJson(map));
  }

  static ExamBloc newInstance = ExamBloc();
}
