import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/course_info_model.dart';

class CourseInfoBloc extends BlocProvider<CourseInfo> {
  void doGetCourseInfoRequest({String id, String taskId, String flag}) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    print(token);
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({"id": id, "taskId": taskId, "flag": flag});
    print(data);
    Response response = await Dio(options).post("courseInfo", data: data);
    doRequest(response: response, dispose: (map) => CourseInfo.fromJson(map));
  }

  static CourseInfoBloc newInstance = CourseInfoBloc();
}
