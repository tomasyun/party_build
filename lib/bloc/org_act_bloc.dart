import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';
import 'package:party_build/bloc/bloc_provider.dart';
import 'package:party_build/global/sharedpreferences.dart';
import 'package:party_build/model/org_act_model.dart';

class OrgActBloc extends BlocProvider<OrgAct> {
  void doGetOrgActRequest() async {
    String token;
    await SpUtils().getString("token").then((value) {
      token = value;
    });
    Options options =
        Options(baseUrl: BASE_URL, headers: {"Authorization": token});
    Response response = await Dio(options).post("orgActList");
    doRequest(response: response, dispose: (map) => OrgAct.fromJson(map));
  }

  static OrgActBloc newInstance = OrgActBloc();
}
