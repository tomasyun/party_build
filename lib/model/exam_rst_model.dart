import 'dart:convert' show json;

class ExamRst {
  String code;
  String msg;
  ExamRstData data;

  ExamRst.fromParams({this.code, this.msg, this.data});

  factory ExamRst(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new ExamRst.fromJson(json.decode(jsonStr))
          : new ExamRst.fromJson(jsonStr);

  ExamRst.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null
        ? null
        : new ExamRstData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class ExamRstData {
  double examScore;
  String isPass;

  ExamRstData.fromParams({this.examScore, this.isPass});

  ExamRstData.fromJson(jsonRes) {
    examScore = jsonRes['examScore'];
    isPass = jsonRes['isPass'];
  }

  @override
  String toString() {
    return '{"examScore": $examScore,"isPass": ${isPass != null ? '${json.encode(isPass)}' : 'null'}}';
  }
}
