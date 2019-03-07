import 'dart:convert' show json;

class Home {
  String code;
  String msg;
  HomeData data;

  Home.fromParams({this.code, this.msg, this.data});

  factory Home(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new Home.fromJson(json.decode(jsonStr))
          : new Home.fromJson(jsonStr);

  Home.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data =
        jsonRes['data'] == null ? null : new HomeData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class HomeData {
  List<BannerModel> advertisement;
  AnnounceModel announcement;

  HomeData.fromParams({this.advertisement, this.announcement});

  HomeData.fromJson(jsonRes) {
    advertisement = jsonRes['advertisement'] == null ? null : [];

    for (var advertisementItem
        in advertisement == null ? [] : jsonRes['advertisement']) {
      advertisement.add(advertisementItem == null
          ? null
          : new BannerModel.fromJson(advertisementItem));
    }

    announcement = jsonRes['announcement'] == null
        ? null
        : new AnnounceModel.fromJson(jsonRes['announcement']);
  }

  @override
  String toString() {
    return '{"advertisement": $advertisement,"announcement": $announcement}';
  }
}

class AnnounceModel {
  String content;
  String id;

  AnnounceModel.fromParams({this.content, this.id});

  AnnounceModel.fromJson(jsonRes) {
    content = jsonRes['content'];
    id = jsonRes['id'];
  }

  @override
  String toString() {
    return '{"content": ${content != null ? '${json.encode(content)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'}}';
  }
}

class BannerModel {
  String advertImg;
  String advertTitle;
  String id;

  BannerModel.fromParams({this.advertImg, this.advertTitle, this.id});

  BannerModel.fromJson(jsonRes) {
    advertImg = jsonRes['advertImg'];
    advertTitle = jsonRes['advertTitle'];
    id = jsonRes['id'];
  }

  @override
  String toString() {
    return '{"advertImg": ${advertImg != null ? '${json.encode(advertImg)}' : 'null'},"advertTitle": ${advertTitle != null ? '${json.encode(advertTitle)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'}}';
  }
}
