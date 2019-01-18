import 'dart:convert' show json;

class Info {

  String code;
  String msg;
  InfoData data;

  Info.fromParams({this.code, this.msg, this.data});

  factory Info(jsonStr) => jsonStr == null ? null : jsonStr is String ? new Info.fromJson(json.decode(jsonStr)) : new Info.fromJson(jsonStr);

  Info.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null ? null : new InfoData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null?'${json.encode(code)}':'null'},"msg": ${msg != null?'${json.encode(msg)}':'null'},"data": $data}';
  }
}

class InfoData {

  int draw;
  int length;
  int page;
  int pageNum;
  int recordsFiltered;
  int recordsTotal;
  int start;
  List<InfoModel> data;

  InfoData.fromParams({this.draw, this.length, this.page, this.pageNum, this.recordsFiltered, this.recordsTotal, this.start, this.data});

  InfoData.fromJson(jsonRes) {
    draw = jsonRes['draw'];
    length = jsonRes['length'];
    page = jsonRes['page'];
    pageNum = jsonRes['pageNum'];
    recordsFiltered = jsonRes['recordsFiltered'];
    recordsTotal = jsonRes['recordsTotal'];
    start = jsonRes['start'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']){
      data.add(dataItem == null ? null : new InfoModel.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"draw": $draw,"length": $length,"page": $page,"pageNum": $pageNum,"recordsFiltered": $recordsFiltered,"recordsTotal": $recordsTotal,"start": $start,"data": $data}';
  }
}

class InfoModel {

  String commentNum;
  String id;
  String publishDate;
  String title;

  InfoModel.fromParams({this.commentNum, this.id, this.publishDate, this.title});

  InfoModel.fromJson(jsonRes) {
    commentNum = jsonRes['commentNum'];
    id = jsonRes['id'];
    publishDate = jsonRes['publishDate'];
    title = jsonRes['title'];
  }

  @override
  String toString() {
    return '{"commentNum": ${commentNum != null?'${json.encode(commentNum)}':'null'},"id": ${id != null?'${json.encode(id)}':'null'},"publishDate": ${publishDate != null?'${json.encode(publishDate)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'}}';
  }
}

