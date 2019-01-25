import 'dart:convert' show json;

class Rank {
  String code;
  String msg;
  RankData data;

  Rank.fromParams({this.code, this.msg, this.data});

  factory Rank(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new Rank.fromJson(json.decode(jsonStr))
          : new Rank.fromJson(jsonStr);

  Rank.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data =
        jsonRes['data'] == null ? null : new RankData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class RankData {
  String id;
  String mavatar;
  String mrank;
  String mscore;
  List<RankModel> creditInfoList;

  RankData.fromParams(
      {this.id, this.mavatar, this.mrank, this.mscore, this.creditInfoList});

  RankData.fromJson(jsonRes) {
    id = jsonRes['id'];
    mavatar = jsonRes['mavatar'];
    mrank = jsonRes['mrank'];
    mscore = jsonRes['mscore'];
    creditInfoList = jsonRes['creditInfoList'] == null ? null : [];

    for (var creditInfoListItem
        in creditInfoList == null ? [] : jsonRes['creditInfoList']) {
      creditInfoList.add(creditInfoListItem == null
          ? null
          : new RankModel.fromJson(creditInfoListItem));
    }
  }

  @override
  String toString() {
    return '{"id": ${id != null ? '${json.encode(id)}' : 'null'},"mavatar": ${mavatar != null ? '${json.encode(mavatar)}' : 'null'},"mrank": ${mrank != null ? '${json.encode(mrank)}' : 'null'},"mscore": ${mscore != null ? '${json.encode(mscore)}' : 'null'},"creditInfoList": $creditInfoList}';
  }
}

class RankModel {
  String avatar;
  String id;
  String name;
  String rank;
  String score;

  RankModel.fromParams(
      {this.avatar, this.id, this.name, this.rank, this.score});

  RankModel.fromJson(jsonRes) {
    avatar = jsonRes['avatar'];
    id = jsonRes['id'];
    name = jsonRes['name'];
    rank = jsonRes['rank'];
    score = jsonRes['score'];
  }

  @override
  String toString() {
    return '{"avatar": ${avatar != null ? '${json.encode(avatar)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'},"rank": ${rank != null ? '${json.encode(rank)}' : 'null'},"score": ${score != null ? '${json.encode(score)}' : 'null'}}';
  }
}
