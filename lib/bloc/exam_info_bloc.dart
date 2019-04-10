import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/exam_info_model.dart';

class ExamInfoBloc extends BlocProvider<ExamInfo> {
  void getExamInfoRequest({String id}) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({"id": id});
    print(data);
    Response response = await Dio(options).post("examRule", data: data);
    doRequest(response: response, dispose: (map) => ExamInfo.fromJson(map));
  }

  static ExamInfoBloc newInstance = ExamInfoBloc();
}
