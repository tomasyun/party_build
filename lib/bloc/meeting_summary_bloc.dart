import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/meeting_summary_model.dart';

class MeetingSummaryBloc extends BlocProvider<MeetingSummary> {
  void doGetMeetingSummaryRequest({String id}) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    print(token);
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({"id": id});
    print(data);
    Response response = await Dio(options).post("meetingSummary", data: data);
    doRequest(
        response: response, dispose: (map) => MeetingSummary.fromJson(map));
  }

  static MeetingSummaryBloc newInstance = MeetingSummaryBloc();
}
