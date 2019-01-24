import 'dart:convert' show json;

class Letter {

  String code;
  String msg;
  List<LetterModel> data;

  Letter.fromParams({this.code, this.msg, this.data});

  factory Letter(jsonStr) => jsonStr == null ? null : jsonStr is String ? new Letter.fromJson(json.decode(jsonStr)) : new Letter.fromJson(jsonStr);

  Letter.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']){
      data.add(dataItem == null ? null : new LetterModel.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": ${code != null?'${json.encode(code)}':'null'},"msg": ${msg != null?'${json.encode(msg)}':'null'},"data": $data}';
  }
}

class LetterModel {

  String isRead;
  String avatar;
  String content;
  String id;
  String name;
  String submitDate;

  LetterModel.fromParams({this.isRead, this.avatar, this.content, this.id, this.name, this.submitDate});

  LetterModel.fromJson(jsonRes) {
    isRead = jsonRes['isRead'];
    avatar = jsonRes['avatar'];
    content = jsonRes['content'];
    id = jsonRes['id'];
    name = jsonRes['name'];
    submitDate = jsonRes['submitDate'];
  }

  @override
  String toString() {
    return '{"isRead": ${isRead != null?'${json.encode(isRead)}':'null'},"avatar": ${avatar != null?'${json.encode(avatar)}':'null'},"content": ${content != null?'${json.encode(content)}':'null'},"id": ${id != null?'${json.encode(id)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"submitDate": ${submitDate != null?'${json.encode(submitDate)}':'null'}}';
  }
}

