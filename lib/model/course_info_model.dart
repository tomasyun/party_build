import 'dart:convert' show json;

class CourseInfo {
  String code;
  String msg;
  CourseInfoData data;

  CourseInfo.fromParams({this.code, this.msg, this.data});

  factory CourseInfo(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new CourseInfo.fromJson(json.decode(jsonStr))
          : new CourseInfo.fromJson(jsonStr);

  CourseInfo.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null
        ? null
        : new CourseInfoData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class CourseInfoData {
  double courseHours;
  String context;
  String hoursOk;
  String id;
  String title;

  CourseInfoData.fromParams(
      {this.courseHours, this.context, this.hoursOk, this.id, this.title});

  CourseInfoData.fromJson(jsonRes) {
    courseHours = jsonRes['courseHours'];
    context = jsonRes['context'];
    hoursOk = jsonRes['hoursOk'];
    id = jsonRes['id'];
    title = jsonRes['title'];
  }

  @override
  String toString() {
    return '{"courseHours": $courseHours,"context": ${context != null ? '${json.encode(context)}' : 'null'},"hoursOk": ${hoursOk != null ? '${json.encode(hoursOk)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'}}';
  }
}
