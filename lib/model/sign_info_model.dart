import 'dart:convert' show json;

class SignInfo {
  String code;
  String msg;
  SignInfoData data;

  SignInfo.fromParams({this.code, this.msg, this.data});

  factory SignInfo(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new SignInfo.fromJson(json.decode(jsonStr))
          : new SignInfo.fromJson(jsonStr);

  SignInfo.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null
        ? null
        : new SignInfoData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class SignInfoData {
  String address;
  String id;
  String startDate;
  String theme;
  String themeImg;
  String type;

  SignInfoData.fromParams(
      {this.address,
      this.id,
      this.startDate,
      this.theme,
      this.themeImg,
      this.type});

  SignInfoData.fromJson(jsonRes) {
    address = jsonRes['address'];
    id = jsonRes['id'];
    startDate = jsonRes['startDate'];
    theme = jsonRes['theme'];
    themeImg = jsonRes['themeImg'];
    type = jsonRes['type'];
  }

  @override
  String toString() {
    return '{"address": ${address != null ? '${json.encode(address)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"startDate": ${startDate != null ? '${json.encode(startDate)}' : 'null'},"theme": ${theme != null ? '${json.encode(theme)}' : 'null'},"themeImg": ${themeImg != null ? '${json.encode(themeImg)}' : 'null'},"type": ${type != null ? '${json.encode(type)}' : 'null'}}';
  }
}
