import 'dart:convert' show json;

class Credit {
  String code;
  String msg;
  CreditModel data;

  Credit.fromParams({this.code, this.msg, this.data});

  factory Credit(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new Credit.fromJson(json.decode(jsonStr))
          : new Credit.fromJson(jsonStr);

  Credit.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null
        ? null
        : new CreditModel.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class CreditModel {
  int totalScore;
  List<CreditData> creditList;

  CreditModel.fromParams({this.totalScore, this.creditList});

  CreditModel.fromJson(jsonRes) {
    totalScore = jsonRes['totalScore'];
    creditList = jsonRes['creditList'] == null ? null : [];

    for (var creditListItem
        in creditList == null ? [] : jsonRes['creditList']) {
      creditList.add(creditListItem == null
          ? null
          : new CreditData.fromJson(creditListItem));
    }
  }

  @override
  String toString() {
    return '{"totalScore": $totalScore,"creditList": $creditList}';
  }
}

class CreditData {
  String auditDate;
  String id;
  String score;
  String title;

  CreditData.fromParams({this.auditDate, this.id, this.score, this.title});

  CreditData.fromJson(jsonRes) {
    auditDate = jsonRes['auditDate'];
    id = jsonRes['id'];
    score = jsonRes['score'];
    title = jsonRes['title'];
  }

  @override
  String toString() {
    return '{"auditDate": ${auditDate != null ? '${json.encode(auditDate)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"score": ${score != null ? '${json.encode(score)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'}}';
  }
}
