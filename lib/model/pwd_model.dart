import 'dart:convert' show json;

class PasswordModel {
  String code;
  String msg;

  PasswordModel.fromParams({this.code, this.msg});

  factory PasswordModel(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new PasswordModel.fromJson(json.decode(jsonStr))
          : new PasswordModel.fromJson(jsonStr);

  PasswordModel.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'}}';
  }
}
