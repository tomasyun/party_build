import 'package:dio/dio.dart';

class GlobalApi{
  void doRequest({Response response, Function success, Function error,
    Function empty}) async {
    int code = response.statusCode;
    if (code >= 200 && code <= 300) {
      Map<String, dynamic> data = response.data;
      print(data);
      if (data != null) {
        success(data);
      } else {
        empty();
      }
    } else {
      error("请求失败:$code");
    }
  }
}
