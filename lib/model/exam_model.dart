import 'dart:convert' show json;

class ExamModel {

  String code;
  String msg;
  List<Exam> data;

  ExamModel.fromParams({this.code, this.msg, this.data});

  factory ExamModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new ExamModel.fromJson(json.decode(jsonStr)) : new ExamModel.fromJson(jsonStr);

  ExamModel.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']){
      data.add(dataItem == null ? null : new Exam.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": ${code != null?'${json.encode(code)}':'null'},"msg": ${msg != null?'${json.encode(msg)}':'null'},"data": $data}';
  }
}

class Exam {

  String endDate;
  String examScore;
  String id;
  String isPass;
  String limitDate;
  String title;

  Exam.fromParams({this.endDate, this.examScore, this.id, this.isPass, this.limitDate, this.title});

  Exam.fromJson(jsonRes) {
    endDate = jsonRes['endDate'];
    examScore = jsonRes['examScore'];
    id = jsonRes['id'];
    isPass = jsonRes['isPass'];
    limitDate = jsonRes['limitDate'];
    title = jsonRes['title'];
  }

  @override
  String toString() {
    return '{"endDate": ${endDate != null?'${json.encode(endDate)}':'null'},"examScore": ${examScore != null?'${json.encode(examScore)}':'null'},"id": ${id != null?'${json.encode(id)}':'null'},"isPass": ${isPass != null?'${json.encode(isPass)}':'null'},"limitDate": ${limitDate != null?'${json.encode(limitDate)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'}}';
  }
}

