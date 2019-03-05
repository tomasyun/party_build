import 'dart:convert' show json;

class Task {
  String code;
  String msg;
  List<TaskModel> data;

  Task.fromParams({this.code, this.msg, this.data});

  factory Task(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new Task.fromJson(json.decode(jsonStr))
          : new Task.fromJson(jsonStr);

  Task.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']) {
      data.add(dataItem == null ? null : new TaskModel.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class TaskModel {
  String curHours;
  String id;
  String isElective;
  String limitDate;
  String taskState;
  String title;
  String totalHours;

  TaskModel.fromParams(
      {this.curHours,
      this.id,
      this.isElective,
      this.limitDate,
      this.taskState,
      this.title,
      this.totalHours});

  TaskModel.fromJson(jsonRes) {
    curHours = jsonRes['curHours'];
    id = jsonRes['id'];
    isElective = jsonRes['isElective'];
    limitDate = jsonRes['limitDate'];
    taskState = jsonRes['taskState'];
    title = jsonRes['title'];
    totalHours = jsonRes['totalHours'];
  }

  @override
  String toString() {
    return '{"curHours": ${curHours != null ? '${json.encode(curHours)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"isElective": ${isElective != null ? '${json.encode(isElective)}' : 'null'},"limitDate": ${limitDate != null ? '${json.encode(limitDate)}' : 'null'},"taskState": ${taskState != null ? '${json.encode(taskState)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'},"totalHours": ${totalHours != null ? '${json.encode(totalHours)}' : 'null'}}';
  }
}
