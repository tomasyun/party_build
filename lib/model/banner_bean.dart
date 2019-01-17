import 'package:party_build/banner/banner_item.dart';

class BannerBean with BannerItem {
  final String url;
  final String title;

  BannerBean({this.url, this.title});

  @override
  get bTitle => title;

  @override
  get bUrl => url;
}
