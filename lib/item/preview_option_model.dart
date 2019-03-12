import 'dart:convert' show json;

class PreviewOption {
  String code;
  String msg;
  PreviewOptionData data;

  PreviewOption.fromParams({this.code, this.msg, this.data});

  factory PreviewOption(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new PreviewOption.fromJson(json.decode(jsonStr))
          : new PreviewOption.fromJson(jsonStr);

  PreviewOption.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null
        ? null
        : new PreviewOptionData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class PreviewOptionData {
  String answer;
  String content;
  String id;
  String typeId;
  List<PreviewOptionModel> questionOptionsList;

  PreviewOptionData.fromParams(
      {this.answer,
      this.content,
      this.id,
      this.typeId,
      this.questionOptionsList});

  PreviewOptionData.fromJson(jsonRes) {
    answer = jsonRes['answer'];
    content = jsonRes['content'];
    id = jsonRes['id'];
    typeId = jsonRes['typeId'];
    questionOptionsList = jsonRes['questionOptionsList'] == null ? null : [];

    for (var questionOptionsListItem
        in questionOptionsList == null ? [] : jsonRes['questionOptionsList']) {
      questionOptionsList.add(questionOptionsListItem == null
          ? null
          : new PreviewOptionModel.fromJson(questionOptionsListItem));
    }
  }

  @override
  String toString() {
    return '{"answer": ${answer != null ? '${json.encode(answer)}' : 'null'},"content": ${content != null ? '${json.encode(content)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"typeId": ${typeId != null ? '${json.encode(typeId)}' : 'null'},"questionOptionsList": $questionOptionsList}';
  }
}

class PreviewOptionModel {
  String content;
  String id;
  String isTrue;
  String name;
  String questionId;

  PreviewOptionModel.fromParams(
      {this.content, this.id, this.isTrue, this.name, this.questionId});

  PreviewOptionModel.fromJson(jsonRes) {
    content = jsonRes['content'];
    id = jsonRes['id'];
    isTrue = jsonRes['isTrue'];
    name = jsonRes['name'];
    questionId = jsonRes['questionId'];
  }

  @override
  String toString() {
    return '{"content": ${content != null ? '${json.encode(content)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"isTrue": ${isTrue != null ? '${json.encode(isTrue)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'},"questionId": ${questionId != null ? '${json.encode(questionId)}' : 'null'}}';
  }
}
