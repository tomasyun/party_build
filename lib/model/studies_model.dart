import 'dart:convert' show json;

class Studies {
  String code;
  String msg;
  StudiesData data;

  Studies.fromParams({this.code, this.msg, this.data});

  factory Studies(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new Studies.fromJson(json.decode(jsonStr))
          : new Studies.fromJson(jsonStr);

  Studies.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null
        ? null
        : new StudiesData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class StudiesData {
  String content;
  String id;
  List<CourseModel> courseList;

  StudiesData.fromParams({this.content, this.id, this.courseList});

  StudiesData.fromJson(jsonRes) {
    content = jsonRes['content'];
    id = jsonRes['id'];
    courseList = jsonRes['courseList'] == null ? null : [];

    for (var courseListItem
        in courseList == null ? [] : jsonRes['courseList']) {
      courseList.add(courseListItem == null
          ? null
          : new CourseModel.fromJson(courseListItem));
    }
  }

  @override
  String toString() {
    return '{"content": ${content != null ? '${json.encode(content)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"courseList": $courseList}';
  }
}

class CourseModel {
  String courseId;
  String title;

  CourseModel.fromParams({this.courseId, this.title});

  CourseModel.fromJson(jsonRes) {
    courseId = jsonRes['courseId'];
    title = jsonRes['title'];
  }

  @override
  String toString() {
    return '{"courseId": ${courseId != null ? '${json.encode(courseId)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'}}';
  }
}
