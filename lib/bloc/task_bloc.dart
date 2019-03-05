import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/task_model.dart';

class TaskBloc extends BlocProvider<Task> {
  void doGetTaskListRequest() async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    print(token);
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    Response response = await Dio(options).post("studyTaskList");
    doRequest(response: response, dispose: (map) => Task.fromJson(map));
  }

  static TaskBloc newInstance = TaskBloc();
}
