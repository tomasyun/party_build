import 'dart:convert' show json;

class Survey {
  String code;
  String msg;
  List<SurveyModel> data;

  Survey.fromParams({this.code, this.msg, this.data});

  factory Survey(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new Survey.fromJson(json.decode(jsonStr))
          : new Survey.fromJson(jsonStr);

  Survey.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']) {
      data.add(dataItem == null ? null : new SurveyModel.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class SurveyModel {
  String id;
  String isSubmit;
  String limitDate;
  String participants;
  String title;

  SurveyModel.fromParams(
      {this.id, this.isSubmit, this.limitDate, this.participants, this.title});

  SurveyModel.fromJson(jsonRes) {
    id = jsonRes['id'];
    isSubmit = jsonRes['isSubmit'];
    limitDate = jsonRes['limitDate'];
    participants = jsonRes['participants'];
    title = jsonRes['title'];
  }

  @override
  String toString() {
    return '{"id": ${id != null ? '${json.encode(id)}' : 'null'},"isSubmit": ${isSubmit != null ? '${json.encode(isSubmit)}' : 'null'},"limitDate": ${limitDate != null ? '${json.encode(limitDate)}' : 'null'},"participants": ${participants != null ? '${json.encode(participants)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'}}';
  }
}
