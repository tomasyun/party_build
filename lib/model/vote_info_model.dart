import 'dart:convert' show json;

class VoteInfo {
  String code;
  String msg;
  VoteInfoData data;

  VoteInfo.fromParams({this.code, this.msg, this.data});

  factory VoteInfo(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new VoteInfo.fromJson(json.decode(jsonStr))
          : new VoteInfo.fromJson(jsonStr);

  VoteInfo.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null
        ? null
        : new VoteInfoData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class VoteInfoData {
  String description;
  String id;
  String limitDate;
  String title;
  String voteType;
  List<VoteInfoModel> options;

  VoteInfoData.fromParams(
      {this.description,
      this.id,
      this.limitDate,
      this.title,
      this.voteType,
      this.options});

  VoteInfoData.fromJson(jsonRes) {
    description = jsonRes['description'];
    id = jsonRes['id'];
    limitDate = jsonRes['limitDate'];
    title = jsonRes['title'];
    voteType = jsonRes['voteType'];
    options = jsonRes['options'] == null ? null : [];

    for (var optionsItem in options == null ? [] : jsonRes['options']) {
      options.add(
          optionsItem == null ? null : new VoteInfoModel.fromJson(optionsItem));
    }
  }

  @override
  String toString() {
    return '{"description": ${description != null ? '${json.encode(description)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"limitDate": ${limitDate != null ? '${json.encode(limitDate)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'},"voteType": ${voteType != null ? '${json.encode(voteType)}' : 'null'},"options": $options}';
  }
}

class VoteInfoModel {
  String id;
  String isVote;
  String option;
  String votes;

  VoteInfoModel.fromParams({this.id, this.isVote, this.option, this.votes});

  VoteInfoModel.fromJson(jsonRes) {
    id = jsonRes['id'];
    isVote = jsonRes['isVote'];
    option = jsonRes['option'];
    votes = jsonRes['votes'];
  }

  @override
  String toString() {
    return '{"id": ${id != null ? '${json.encode(id)}' : 'null'},"isVote": ${isVote != null ? '${json.encode(isVote)}' : 'null'},"option": ${option != null ? '${json.encode(option)}' : 'null'},"votes": ${votes != null ? '${json.encode(votes)}' : 'null'}}';
  }
}
