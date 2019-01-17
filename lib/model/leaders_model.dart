import 'dart:convert' show json;

class Leaders {

  String code;
  String msg;
  List<LeaderData> data;

  Leaders.fromParams({this.code, this.msg, this.data});

  factory Leaders(jsonStr) => jsonStr == null ? null : jsonStr is String ? new Leaders.fromJson(json.decode(jsonStr)) : new Leaders.fromJson(jsonStr);

  Leaders.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']){
      data.add(dataItem == null ? null : new LeaderData.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": ${code != null?'${json.encode(code)}':'null'},"msg": ${msg != null?'${json.encode(msg)}':'null'},"data": $data}';
  }
}

class LeaderData {

  String id;
  String name;
  String position;

  LeaderData.fromParams({this.id, this.name, this.position});

  LeaderData.fromJson(jsonRes) {
    id = jsonRes['id'];
    name = jsonRes['name'];
    position = jsonRes['position'];
  }

  @override
  String toString() {
    return '{"id": ${id != null?'${json.encode(id)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"position": ${position != null?'${json.encode(position)}':'null'}}';
  }
}

