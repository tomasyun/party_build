import 'dart:convert' show json;

class NoticeInfo {
  String code;
  String msg;
  NoticeInfoData data;

  NoticeInfo.fromParams({this.code, this.msg, this.data});

  factory NoticeInfo(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new NoticeInfo.fromJson(json.decode(jsonStr))
          : new NoticeInfo.fromJson(jsonStr);

  NoticeInfo.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null
        ? null
        : new NoticeInfoData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class NoticeInfoData {
  String name;
  String content;
  String id;
  String publishDate;
  String title;
  List<dynamic> commitList;

  NoticeInfoData.fromParams(
      {this.name,
      this.content,
      this.id,
      this.publishDate,
      this.title,
      this.commitList});

  NoticeInfoData.fromJson(jsonRes) {
    name = jsonRes['name'];
    content = jsonRes['content'];
    id = jsonRes['id'];
    publishDate = jsonRes['publishDate'];
    title = jsonRes['title'];
    commitList = jsonRes['commitList'] == null ? null : [];

    for (var commitListItem
        in commitList == null ? [] : jsonRes['commitList']) {
      commitList.add(commitListItem);
    }
  }

  @override
  String toString() {
    return '{"name": ${name != null ? '${json.encode(name)}' : 'null'},"content": ${content != null ? '${json.encode(content)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"publishDate": ${publishDate != null ? '${json.encode(publishDate)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'},"commitList": $commitList}';
  }
}
