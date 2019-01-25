import 'dart:convert' show json;

class Vote {
  String code;
  String msg;
  List<VoteModel> data;

  Vote.fromParams({this.code, this.msg, this.data});

  factory Vote(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new Vote.fromJson(json.decode(jsonStr))
          : new Vote.fromJson(jsonStr);

  Vote.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']) {
      data.add(dataItem == null ? null : new VoteModel.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class VoteModel {
  String id;
  String isVoter;
  String limitDate;
  String title;
  String voterNum;

  VoteModel.fromParams(
      {this.id, this.isVoter, this.limitDate, this.title, this.voterNum});

  VoteModel.fromJson(jsonRes) {
    id = jsonRes['id'];
    isVoter = jsonRes['isVoter'];
    limitDate = jsonRes['limitDate'];
    title = jsonRes['title'];
    voterNum = jsonRes['voterNum'];
  }

  @override
  String toString() {
    return '{"id": ${id != null ? '${json.encode(id)}' : 'null'},"isVoter": ${isVoter != null ? '${json.encode(isVoter)}' : 'null'},"limitDate": ${limitDate != null ? '${json.encode(limitDate)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'},"voterNum": ${voterNum != null ? '${json.encode(voterNum)}' : 'null'}}';
  }
}
