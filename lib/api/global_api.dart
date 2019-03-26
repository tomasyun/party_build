import 'package:dio/dio.dart';
import 'package:party_build/api/const.dart';

class GlobalApi {
  void doRequest({Response response,
    Function success,
    Function error,
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

  String doFormatImageUrl({String url}) {
    String newUrl = "";
    if (url.substring(0, 1) == "/") {
      newUrl = url.substring(1, url.length);
      return BASE_URL + newUrl;
    }
    return BASE_URL + url;
  }
}
