import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/studies_model.dart';

class StudiesBloc extends BlocProvider<Studies> {
  void doGetStudiesTaskRequest({String id}) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    print(token);
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({"id": id});
    print(data);
    Response response = await Dio(options).post("studyTaskInfo", data: data);
    doRequest(response: response, dispose: (map) => Studies.fromJson(map));
  }

  static StudiesBloc newInstance = StudiesBloc();
}
