import 'dart:convert' show json;

class ExamRst {
  String limitScore;
  List<ExamRstModel> testAnswers;
  ExamRstdata examRecord;

  ExamRst.fromParams({this.limitScore, this.testAnswers, this.examRecord});

  factory ExamRst(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new ExamRst.fromJson(json.decode(jsonStr))
          : new ExamRst.fromJson(jsonStr);

  ExamRst.fromJson(jsonRes) {
    limitScore = jsonRes['limitScore'];
    testAnswers = jsonRes['testAnswers'] == null ? null : [];

    for (var testAnswersItem
        in testAnswers == null ? [] : jsonRes['testAnswers']) {
      testAnswers.add(testAnswersItem == null
          ? null
          : new ExamRstModel.fromJson(testAnswersItem));
    }

    examRecord = jsonRes['examRecord'] == null
        ? null
        : new ExamRstdata.fromJson(jsonRes['examRecord']);
  }

  @override
  String toString() {
    return '{"limitScore": ${limitScore != null ? '${json.encode(limitScore)}' : 'null'},"testAnswers": $testAnswers,"examRecord": $examRecord}';
  }
}

class ExamRstdata {
  String examCost;
  String examRuleId;
  String examTime;

  ExamRstdata.fromParams({this.examCost, this.examRuleId, this.examTime});

  ExamRstdata.fromJson(jsonRes) {
    examCost = jsonRes['examCost'];
    examRuleId = jsonRes['examRuleId'];
    examTime = jsonRes['examTime'];
  }

  @override
  String toString() {
    return '{"examCost": ${examCost != null ? '${json.encode(examCost)}' : 'null'},"examRuleId": ${examRuleId != null ? '${json.encode(examRuleId)}' : 'null'},"examTime": ${examTime != null ? '${json.encode(examTime)}' : 'null'}}';
  }
}

class ExamRstModel {
  String answer;
  String questionId;

  ExamRstModel({this.answer, this.questionId});

  ExamRstModel.fromParams({this.answer, this.questionId});

  ExamRstModel.fromJson(jsonRes) {
    answer = jsonRes['answer'];
    questionId = jsonRes['questionId'];
  }

  @override
  String toString() {
    return '{"answer": ${answer != null ? '${json.encode(answer)}' : 'null'},"questionId": ${questionId != null ? '${json.encode(questionId)}' : 'null'}}';
  }
}
