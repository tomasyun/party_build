import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/org_act_info_model.dart';

class OrgActInfoBloc extends BlocProvider<OrgActInfo> {
  Future doGetOrgActRequest({String id}) async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    FormData data = FormData.from({"id": id});
    print(data);
    Response response = await Dio(options).post("conferenceBrief", data: data);
    doRequest(response: response, dispose: (map) => OrgActInfo.fromJson(map));
  }

  static OrgActInfoBloc newInstance = OrgActInfoBloc();
}
