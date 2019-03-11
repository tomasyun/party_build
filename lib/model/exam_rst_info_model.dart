import 'dart:convert' show json;

class ExamRstInfo {
  String code;
  String msg;
  ExamRstInfoData data;

  ExamRstInfo.fromParams({this.code, this.msg, this.data});

  factory ExamRstInfo(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new ExamRstInfo.fromJson(json.decode(jsonStr))
          : new ExamRstInfo.fromJson(jsonStr);

  ExamRstInfo.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null
        ? null
        : new ExamRstInfoData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class ExamRstInfoData {
  String examCost;
  String examRuleId;
  String examScore;
  String id;
  String isPass;
  List<ExamRstInfoModel> questionIds;

  ExamRstInfoData.fromParams(
      {this.examCost,
      this.examRuleId,
      this.examScore,
      this.id,
      this.isPass,
      this.questionIds});

  ExamRstInfoData.fromJson(jsonRes) {
    examCost = jsonRes['examCost'];
    examRuleId = jsonRes['examRuleId'];
    examScore = jsonRes['examScore'];
    id = jsonRes['id'];
    isPass = jsonRes['isPass'];
    questionIds = jsonRes['questionIds'] == null ? null : [];

    for (var questionIdsItem
        in questionIds == null ? [] : jsonRes['questionIds']) {
      questionIds.add(questionIdsItem == null
          ? null
          : new ExamRstInfoModel.fromJson(questionIdsItem));
    }
  }

  @override
  String toString() {
    return '{"examCost": ${examCost != null ? '${json.encode(examCost)}' : 'null'},"examRuleId": ${examRuleId != null ? '${json.encode(examRuleId)}' : 'null'},"examScore": ${examScore != null ? '${json.encode(examScore)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"isPass": ${isPass != null ? '${json.encode(isPass)}' : 'null'},"questionIds": $questionIds}';
  }
}

class ExamRstInfoModel {
  String id;
  String isTrue;
  String questionId;

  ExamRstInfoModel.fromParams({this.id, this.isTrue, this.questionId});

  ExamRstInfoModel.fromJson(jsonRes) {
    id = jsonRes['id'];
    isTrue = jsonRes['isTrue'];
    questionId = jsonRes['questionId'];
  }

  @override
  String toString() {
    return '{"id": ${id != null ? '${json.encode(id)}' : 'null'},"isTrue": ${isTrue != null ? '${json.encode(isTrue)}' : 'null'},"questionId": ${questionId != null ? '${json.encode(questionId)}' : 'null'}}';
  }
}
