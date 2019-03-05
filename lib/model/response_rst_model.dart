import 'dart:convert' show json;

class ResponseRstModel {
  String code;
  String msg;

  ResponseRstModel.fromParams({this.code, this.msg});

  factory ResponseRstModel(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new ResponseRstModel.fromJson(json.decode(jsonStr))
          : new ResponseRstModel.fromJson(jsonStr);

  ResponseRstModel.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'}}';
  }
}
