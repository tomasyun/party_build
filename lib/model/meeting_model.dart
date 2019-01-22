import 'dart:convert' show json;

class Meeting {
  String code;
  String msg;
  List<MeetingData> data;

  Meeting.fromParams({this.code, this.msg, this.data});

  factory Meeting(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new Meeting.fromJson(json.decode(jsonStr))
          : new Meeting.fromJson(jsonStr);

  Meeting.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']) {
      data.add(dataItem == null ? null : new MeetingData.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class MeetingData {
  String id;
  String limitDate;
  String state;
  String title;

  MeetingData.fromParams({this.id, this.limitDate, this.state, this.title});

  MeetingData.fromJson(jsonRes) {
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
