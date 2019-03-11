import 'dart:convert' show json;

class ExamSub {
  String limitScore;
  List<ExamSubModel> testAnswers;
  ExamSubData examRecord;

  ExamSub.fromParams({this.limitScore, this.testAnswers, this.examRecord});

  factory ExamSub(jsonStr) =>
      jsonStr == null
      ? null
      : jsonStr is String
          ? new ExamSub.fromJson(json.decode(jsonStr))
          : new ExamSub.fromJson(jsonStr);

  ExamSub.fromJson(jsonRes) {
    limitScore = jsonRes['limitScore'];
    testAnswers = jsonRes['testAnswers'] == null ? null : [];

    for (var testAnswersItem
        in testAnswers == null ? [] : jsonRes['testAnswers']) {
      testAnswers.add(testAnswersItem == null
          ? null
          : new ExamSubModel.fromJson(testAnswersItem));
    }

    examRecord = jsonRes['examRecord'] == null
        ? null
        : new ExamSubData.fromJson(jsonRes['examRecord']);
  }

  @override
  String toString() {
    return '{"limitScore": ${limitScore != null ? '${json.encode(limitScore)}' : 'null'},"testAnswers": $testAnswers,"examRecord": $examRecord}';
  }
}

class ExamSubData {
  String examCost;
  String examRuleId;
  String examTime;

  ExamSubData.fromParams({this.examCost, this.examRuleId, this.examTime});

  ExamSubData.fromJson(jsonRes) {
    examCost = jsonRes['examCost'];
    examRuleId = jsonRes['examRuleId'];
    examTime = jsonRes['examTime'];
  }

  @override
  String toString() {
    return '{"examCost": ${examCost != null ? '${json.encode(examCost)}' : 'null'},"examRuleId": ${examRuleId != null ? '${json.encode(examRuleId)}' : 'null'},"examTime": ${examTime != null ? '${json.encode(examTime)}' : 'null'}}';
  }
}

class ExamSubModel {
  String answer;
  String questionId;

  ExamSubModel({this.answer, this.questionId});

  ExamSubModel.fromParams({this.answer, this.questionId});

  ExamSubModel.fromJson(jsonRes) {
    answer = jsonRes['answer'];
    questionId = jsonRes['questionId'];
  }

  @override
  String toString() {
    return '{"answer": ${answer != null ? '${json.encode(answer)}' : 'null'},"questionId": ${questionId != null ? '${json.encode(questionId)}' : 'null'}}';
  }
}
