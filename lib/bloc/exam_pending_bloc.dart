import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/exam_pending.dart';

class ExamPendingBloc extends BlocProvider<Exam> {
  void doGetExamPending({String type}) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({"type": type});
    Response response = await Dio(options).post("examList", data: data);
    doRequest(response: response, dispose: (map) => Exam.fromJson(map));
  }

  static ExamPendingBloc newInstance = ExamPendingBloc();
}
