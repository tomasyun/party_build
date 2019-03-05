import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/meeting_model.dart';

class MeetingBloc extends BlocProvider<Meeting> {
  void doGetMeetingList() async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    print(token);
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    Response response = await Dio(options).post("conferenceList");
    doRequest(response: response, dispose: (map) => Meeting.fromJson(map));
  }

  static MeetingBloc newInstance = MeetingBloc();
}
