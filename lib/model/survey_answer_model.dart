import 'dart:convert' show json;

class SurveyAnswerRes {
  String id;
  List<AnswerModel> answers;

  SurveyAnswerRes.fromParams({this.id, this.answers});

  factory SurveyAnswerRes(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new SurveyAnswerRes.fromJson(json.decode(jsonStr))
          : new SurveyAnswerRes.fromJson(jsonStr);

  SurveyAnswerRes.fromJson(jsonRes) {
    id = jsonRes['id'];
    answers = jsonRes['answers'] == null ? null : [];

    for (var answersItem in answers == null ? [] : jsonRes['answers']) {
      answers.add(
          answersItem == null ? null : new AnswerModel.fromJson(answersItem));
    }
  }

  @override
  String toString() {
    return '{"id": ${id != null ? '${json.encode(id)}' : 'null'},"answers": $answers}';
  }
}

class AnswerModel {
  String answer;
  String userId;

  AnswerModel({this.answer, this.userId});

  AnswerModel.fromParams({this.answer, this.userId});

  AnswerModel.fromJson(jsonRes) {
    answer = jsonRes['answer'];
    userId = jsonRes['userId'];
  }

  @override
  String toString() {
    return '{"answer": ${answer != null ? '${json.encode(answer)}' : 'null'},"userId": ${userId != null ? '${json.encode(userId)}' : 'null'}}';
  }
}
