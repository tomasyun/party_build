import 'dart:convert' show json;

class Notice {
  String code;
  String msg;
  List<NoticeModel> data;

  Notice.fromParams({this.code, this.msg, this.data});

  factory Notice(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new Notice.fromJson(json.decode(jsonStr))
          : new Notice.fromJson(jsonStr);

  Notice.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']) {
      data.add(dataItem == null ? null : new NoticeModel.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class NoticeModel {
  String avatar;
  String content;
  String id;
  String isReply;
  String name;
  String publishDate;

  NoticeModel.fromParams(
      {this.avatar,
      this.content,
      this.id,
      this.isReply,
      this.name,
      this.publishDate});

  NoticeModel.fromJson(jsonRes) {
    avatar = jsonRes['avatar'];
    content = jsonRes['content'];
    id = jsonRes['id'];
    isReply = jsonRes['isReply'];
    name = jsonRes['name'];
    publishDate = jsonRes['publishDate'];
  }

  @override
  String toString() {
    return '{"avatar": ${avatar != null ? '${json.encode(avatar)}' : 'null'},"content": ${content != null ? '${json.encode(content)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"isReply": ${isReply != null ? '${json.encode(isReply)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'},"publishDate": ${publishDate != null ? '${json.encode(publishDate)}' : 'null'}}';
  }
}
