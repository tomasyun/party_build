import 'dart:convert' show json;

class OrgAct {
  String code;
  String msg;
  List<OrgActModel> data;

  OrgAct.fromParams({this.code, this.msg, this.data});

  factory OrgAct(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new OrgAct.fromJson(json.decode(jsonStr))
          : new OrgAct.fromJson(jsonStr);

  OrgAct.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']) {
      data.add(dataItem == null ? null : new OrgActModel.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class OrgActModel {
  String id;
  String limitDate;
  String state;
  String title;

  OrgActModel.fromParams({this.id, this.limitDate, this.state, this.title});

  OrgActModel.fromJson(jsonRes) {
    id = jsonRes['id'];
    limitDate = jsonRes['limitDate'];
    state = jsonRes['state'];
    title = jsonRes['title'];
  }

  @override
  String toString() {
    return '{"id": ${id != null ? '${json.encode(id)}' : 'null'},"limitDate": ${limitDate != null ? '${json.encode(limitDate)}' : 'null'},"state": ${state != null ? '${json.encode(state)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'}}';
  }
}
