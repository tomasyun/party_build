import 'dart:convert' show json;

class Question {
  String code;
  String msg;
  QuestionData data;

  Question.fromParams({this.code, this.msg, this.data});

  factory Question(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new Question.fromJson(json.decode(jsonStr))
          : new Question.fromJson(jsonStr);

  Question.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null
        ? null
        : new QuestionData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class QuestionData {
  int duration;
  int totalNum;
  List<QuestionList> questionList;

  QuestionData.fromParams({this.duration, this.totalNum, this.questionList});

  QuestionData.fromJson(jsonRes) {
    duration = jsonRes['duration'];
    totalNum = jsonRes['totalNum'];
    questionList = jsonRes['questionList'] == null ? null : [];

    for (var questionListItem
        in questionList == null ? [] : jsonRes['questionList']) {
      questionList.add(questionListItem == null
          ? null
          : new QuestionList.fromJson(questionListItem));
    }
  }

  @override
  String toString() {
    return '{"duration": $duration,"totalNum": $totalNum,"questionList": $questionList}';
  }
}

class QuestionList {
  String score;
  String content;
  String id;
  bool type;
  List<OptionModel> questionOptionsList;

  QuestionList.fromParams(
      {this.score, this.content, this.id, this.type, this.questionOptionsList});

  QuestionList.fromJson(jsonRes) {
    score = jsonRes['score'];
    content = jsonRes['content'];
    id = jsonRes['id'];
    type = jsonRes['type'];
    questionOptionsList = jsonRes['questionOptionsList'] == null ? null : [];

    for (var questionOptionsListItem
        in questionOptionsList == null ? [] : jsonRes['questionOptionsList']) {
      questionOptionsList.add(questionOptionsListItem == null
          ? null
          : new OptionModel.fromJson(questionOptionsListItem));
    }
  }

  @override
  String toString() {
    return '{"score": ${score != null ? '${json.encode(score)}' : 'null'},"content": ${content != null ? '${json.encode(content)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"type": $type,"questionOptionsList": $questionOptionsList}';
  }
}

class OptionModel {
  String content;
  String id;
  String name;
  String questionId;
  String sort;

  OptionModel.fromParams(
      {this.content, this.id, this.name, this.questionId, this.sort});

  OptionModel.fromJson(jsonRes) {
    content = jsonRes['content'];
    id = jsonRes['id'];
    name = jsonRes['name'];
    questionId = jsonRes['questionId'];
    sort = jsonRes['sort'];
  }

  @override
  String toString() {
    return '{"content": ${content != null ? '${json.encode(content)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'},"questionId": ${questionId != null ? '${json.encode(questionId)}' : 'null'},"sort": ${sort != null ? '${json.encode(sort)}' : 'null'}}';
  }
}
