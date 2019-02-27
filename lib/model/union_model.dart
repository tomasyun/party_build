import 'dart:convert' show json;

class Union {
  String code;
  String msg;
  UnionData data;

  Union.fromParams({this.code, this.msg, this.data});

  factory Union(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new Union.fromJson(json.decode(jsonStr))
          : new Union.fromJson(jsonStr);

  Union.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null
        ? null
        : new UnionData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class UnionData {
  int draw;
  int length;
  int page;
  int pageNum;
  int recordsFiltered;
  int recordsTotal;
  int start;
  List<UnionModel> data;

  UnionData.fromParams(
      {this.draw,
      this.length,
      this.page,
      this.pageNum,
      this.recordsFiltered,
      this.recordsTotal,
      this.start,
      this.data});

  UnionData.fromJson(jsonRes) {
    draw = jsonRes['draw'];
    length = jsonRes['length'];
    page = jsonRes['page'];
    pageNum = jsonRes['pageNum'];
    recordsFiltered = jsonRes['recordsFiltered'];
    recordsTotal = jsonRes['recordsTotal'];
    start = jsonRes['start'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']) {
      data.add(dataItem == null ? null : new UnionModel.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"draw": $draw,"length": $length,"page": $page,"pageNum": $pageNum,"recordsFiltered": $recordsFiltered,"recordsTotal": $recordsTotal,"start": $start,"data": $data}';
  }
}

class UnionModel {
  String commentNum;
  String id;
  String publishDate;
  String title;

  UnionModel.fromParams(
      {this.commentNum, this.id, this.publishDate, this.title});

  UnionModel.fromJson(jsonRes) {
    commentNum = jsonRes['commentNum'];
    id = jsonRes['id'];
    publishDate = jsonRes['publishDate'];
    title = jsonRes['title'];
  }

  @override
  String toString() {
    return '{"commentNum": ${commentNum != null ? '${json.encode(commentNum)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"publishDate": ${publishDate != null ? '${json.encode(publishDate)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'}}';
  }
}
