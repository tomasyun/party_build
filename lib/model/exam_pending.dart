import 'dart:convert' show json;

class Exam {
  String code;
  String msg;
  List<ExamModel> data;

  Exam.fromParams({this.code, this.msg, this.data});

  factory Exam(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new Exam.fromJson(json.decode(jsonStr))
          : new Exam.fromJson(jsonStr);

  Exam.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']) {
      data.add(dataItem == null ? null : new ExamModel.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class ExamModel {
  String endDate;
  String examScore;
  String id;
  String isPass;
  String limitDate;
  String title;

  ExamModel.fromParams(
      {this.endDate,
      this.examScore,
      this.id,
      this.isPass,
      this.limitDate,
      this.title});

  ExamModel.fromJson(jsonRes) {
    endDate = jsonRes['endDate'];
    examScore = jsonRes['examScore'];
    id = jsonRes['id'];
    isPass = jsonRes['isPass'];
    limitDate = jsonRes['limitDate'];
    title = jsonRes['title'];
  }

  @override
  String toString() {
    return '{"endDate": ${endDate != null ? '${json.encode(endDate)}' : 'null'},"examScore": ${examScore != null ? '${json.encode(examScore)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"isPass": ${isPass != null ? '${json.encode(isPass)}' : 'null'},"limitDate": ${limitDate != null ? '${json.encode(limitDate)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'}}';
  }
}
