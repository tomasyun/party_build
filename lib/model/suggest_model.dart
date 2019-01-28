import 'dart:convert' show json;

class Suggest {
  String code;
  String msg;

  Suggest.fromParams({this.code, this.msg});

  factory Suggest(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new Suggest.fromJson(json.decode(jsonStr))
          : new Suggest.fromJson(jsonStr);

  Suggest.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'}}';
  }
}
