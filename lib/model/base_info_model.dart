import 'dart:convert' show json;

class BaseInfo {
  String code;
  String msg;
  BaseInfoData data;

  BaseInfo.fromParams({this.code, this.msg, this.data});

  factory BaseInfo(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new BaseInfo.fromJson(json.decode(jsonStr))
          : new BaseInfo.fromJson(jsonStr);

  BaseInfo.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null
        ? null
        : new BaseInfoData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class BaseInfoData {
  String avatar;
  String belongBranch;
  String birthPlace;
  String birthday;
  String brief;
  String company;
  String education;
  String enterDate;
  String enterType;
  String ethnic;
  String id;
  String name;
  String partyNo;
  String phone;
  String username;

  BaseInfoData.fromParams(
      {this.avatar,
      this.belongBranch,
      this.birthPlace,
      this.birthday,
      this.brief,
      this.company,
      this.education,
      this.enterDate,
      this.enterType,
      this.ethnic,
      this.id,
      this.name,
      this.partyNo,
      this.phone,
      this.username});

  BaseInfoData.fromJson(jsonRes) {
    avatar = jsonRes['avatar'];
    belongBranch = jsonRes['belongBranch'];
    birthPlace = jsonRes['birthPlace'];
    birthday = jsonRes['birthday'];
    brief = jsonRes['brief'];
    company = jsonRes['company'];
    education = jsonRes['education'];
    enterDate = jsonRes['enterDate'];
    enterType = jsonRes['enterType'];
    ethnic = jsonRes['ethnic'];
    id = jsonRes['id'];
    name = jsonRes['name'];
    partyNo = jsonRes['partyNo'];
    phone = jsonRes['phone'];
    username = jsonRes['username'];
  }

  @override
  String toString() {
    return '{"avatar": ${avatar != null ? '${json.encode(avatar)}' : 'null'},"belongBranch": ${belongBranch != null ? '${json.encode(belongBranch)}' : 'null'},"birthPlace": ${birthPlace != null ? '${json.encode(birthPlace)}' : 'null'},"birthday": ${birthday != null ? '${json.encode(birthday)}' : 'null'},"brief": ${brief != null ? '${json.encode(brief)}' : 'null'},"company": ${company != null ? '${json.encode(company)}' : 'null'},"education": ${education != null ? '${json.encode(education)}' : 'null'},"enterDate": ${enterDate != null ? '${json.encode(enterDate)}' : 'null'},"enterType": ${enterType != null ? '${json.encode(enterType)}' : 'null'},"ethnic": ${ethnic != null ? '${json.encode(ethnic)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'},"partyNo": ${partyNo != null ? '${json.encode(partyNo)}' : 'null'},"phone": ${phone != null ? '${json.encode(phone)}' : 'null'},"username": ${username != null ? '${json.encode(username)}' : 'null'}}';
  }
}
