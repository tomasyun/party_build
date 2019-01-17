import 'dart:convert' show json;

class LoginModel {

  String code;
  String msg;
  LoginData data;

  LoginModel.fromParams({this.code, this.msg, this.data});

  factory LoginModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new LoginModel.fromJson(json.decode(jsonStr)) : new LoginModel.fromJson(jsonStr);

  LoginModel.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null ? null : new LoginData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": $code,"msg": ${msg != null?'${json.encode(msg)}':'null'},"data": $data}';
  }
}

class LoginData {

  bool isManager;
  String avatar;
  String name;
  String partyPost;
  String token;
  String userId;

  LoginData.fromParams({this.isManager, this.avatar, this.name, this.partyPost, this.token, this.userId});

  LoginData.fromJson(jsonRes) {
    isManager = jsonRes['isManager'];
    avatar = jsonRes['avatar'];
    name = jsonRes['name'];
    partyPost = jsonRes['partyPost'];
    token = jsonRes['token'];
    userId = jsonRes['userId'];
  }

  @override
  String toString() {
    return '{"isManager": $isManager,"avatar": ${avatar != null?'${json.encode(avatar)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"partyPost": ${partyPost != null?'${json.encode(partyPost)}':'null'},"token": ${token != null?'${json.encode(token)}':'null'},"userId": ${userId != null?'${json.encode(userId)}':'null'}}';
  }
}

