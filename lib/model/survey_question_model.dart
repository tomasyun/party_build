import 'dart:convert' show json;

class SurveyQuestion {
  String code;
  String msg;
  List<SurveyQuestionData> data;

  SurveyQuestion.fromParams({this.code, this.msg, this.data});

  factory SurveyQuestion(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new SurveyQuestion.fromJson(json.decode(jsonStr))
          : new SurveyQuestion.fromJson(jsonStr);

  SurveyQuestion.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']) {
      data.add(
          dataItem == null ? null : new SurveyQuestionData.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class SurveyQuestionData {
  String content;
  String id;
  String typeId;
  List<SurveyQuestionModel> questionOptionsList;

  SurveyQuestionData.fromParams(
      {this.content, this.id, this.typeId, this.questionOptionsList});

  SurveyQuestionData.fromJson(jsonRes) {
    content = jsonRes['content'];
    id = jsonRes['id'];
    typeId = jsonRes['typeId'];
    questionOptionsList = jsonRes['questionOptionsList'] == null ? null : [];

    for (var questionOptionsListItem
        in questionOptionsList == null ? [] : jsonRes['questionOptionsList']) {
      questionOptionsList.add(questionOptionsListItem == null
          ? null
          : new SurveyQuestionModel.fromJson(questionOptionsListItem));
    }
  }

  @override
  String toString() {
    return '{"content": ${content != null ? '${json.encode(content)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"typeId": ${typeId != null ? '${json.encode(typeId)}' : 'null'},"questionOptionsList": $questionOptionsList}';
  }
}

class SurveyQuestionModel {
  String content;
  String id;
  String name;

  SurveyQuestionModel.fromParams({this.content, this.id, this.name});

  SurveyQuestionModel.fromJson(jsonRes) {
    content = jsonRes['content'];
    id = jsonRes['id'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"content": ${content != null ? '${json.encode(content)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'}}';
  }
}
