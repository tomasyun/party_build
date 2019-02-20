import 'dart:convert' show json;

class ExamInfo {
  String code;
  String msg;
  ExamInfoModel data;

  ExamInfo.fromParams({this.code, this.msg, this.data});

  factory ExamInfo(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new ExamInfo.fromJson(json.decode(jsonStr))
          : new ExamInfo.fromJson(jsonStr);

  ExamInfo.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null
        ? null
        : new ExamInfoModel.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class ExamInfoModel {
  String examEndTime;
  String examHours;
  String examStartTime;
  String id;
  String isExam;
  String limitScore;
  String questionNum;
  String title;
  String totalScore;

  ExamInfoModel.fromParams(
      {this.examEndTime,
      this.examHours,
      this.examStartTime,
      this.id,
      this.isExam,
      this.limitScore,
      this.questionNum,
      this.title,
      this.totalScore});

  ExamInfoModel.fromJson(jsonRes) {
    examEndTime = jsonRes['examEndTime'];
    examHours = jsonRes['examHours'];
    examStartTime = jsonRes['examStartTime'];
    id = jsonRes['id'];
    isExam = jsonRes['isExam'];
    limitScore = jsonRes['limitScore'];
    questionNum = jsonRes['questionNum'];
    title = jsonRes['title'];
    totalScore = jsonRes['totalScore'];
  }

  @override
  String toString() {
    return '{"examEndTime": ${examEndTime != null ? '${json.encode(examEndTime)}' : 'null'},"examHours": ${examHours != null ? '${json.encode(examHours)}' : 'null'},"examStartTime": ${examStartTime != null ? '${json.encode(examStartTime)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"isExam": ${isExam != null ? '${json.encode(isExam)}' : 'null'},"limitScore": ${limitScore != null ? '${json.encode(limitScore)}' : 'null'},"questionNum": ${questionNum != null ? '${json.encode(questionNum)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'},"totalScore": ${totalScore != null ? '${json.encode(totalScore)}' : 'null'}}';
  }
}
