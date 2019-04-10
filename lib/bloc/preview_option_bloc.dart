import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/item/preview_option_model.dart';

class PreviewOptionBloc extends BlocProvider<PreviewOption> {
  void doPreviewOptionRequest({String id}) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({"id": id});
    Response response =
        await Dio(options).post("getExamQuestionAnswers", data: data);
    doRequest(
        response: response, dispose: (map) => PreviewOption.fromJson(map));
  }

  static PreviewOptionBloc newInstance = PreviewOptionBloc();
}
