import 'dart:convert' show json;

class InfoDetail {
  String code;
  String msg;
  DetailData data;

  InfoDetail.fromParams({this.code, this.msg, this.data});

  factory InfoDetail(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new InfoDetail.fromJson(json.decode(jsonStr))
          : new InfoDetail.fromJson(jsonStr);

  InfoDetail.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null
        ? null
        : new DetailData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class DetailData {
  int browse;
  String attachment;
  String attachmentName;
  String content;
  String id;
  String publicUnit;
  String publishDate;
  String title;
  List<CommitModel> commitList;

  DetailData.fromParams(
      {this.browse,
      this.attachment,
      this.attachmentName,
      this.content,
      this.id,
      this.publicUnit,
      this.publishDate,
      this.title,
      this.commitList});

  DetailData.fromJson(jsonRes) {
    browse = jsonRes['browse'];
    attachment = jsonRes['attachment'];
    attachmentName = jsonRes['attachmentName'];
    content = jsonRes['content'];
    id = jsonRes['id'];
    publicUnit = jsonRes['publicUnit'];
    publishDate = jsonRes['publishDate'];
    title = jsonRes['title'];
    commitList = jsonRes['commitList'] == null ? null : [];

    for (var commitListItem
        in commitList == null ? [] : jsonRes['commitList']) {
      commitList.add(commitListItem == null
          ? null
          : new CommitModel.fromJson(commitListItem));
    }
  }

  @override
  String toString() {
    return '{"browse": $browse,"attachment": ${attachment != null ? '${json.encode(attachment)}' : 'null'},"attachmentName": ${attachmentName != null ? '${json.encode(attachmentName)}' : 'null'},"content": ${content != null ? '${json.encode(content)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"publicUnit": ${publicUnit != null ? '${json.encode(publicUnit)}' : 'null'},"publishDate": ${publishDate != null ? '${json.encode(publishDate)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'},"commitList": $commitList}';
  }
}

class CommitModel {
  String avatar;
  String commitContent;
  String commitDate;
  String id;
  String name;

  CommitModel.fromParams(
      {this.avatar, this.commitContent, this.commitDate, this.id, this.name});

  CommitModel.fromJson(jsonRes) {
    avatar = jsonRes['avatar'];
    commitContent = jsonRes['commitContent'];
    commitDate = jsonRes['commitDate'];
    id = jsonRes['id'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return '{"avatar": ${avatar != null ? '${json.encode(avatar)}' : 'null'},"commitContent": ${commitContent != null ? '${json.encode(commitContent)}' : 'null'},"commitDate": ${commitDate != null ? '${json.encode(commitDate)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'}}';
  }
}
