import 'dart:convert' show json;

class VoteSub {
  String id;
  List<String> optionIds;

  VoteSub.fromParams({this.id, this.optionIds});

  factory VoteSub(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new VoteSub.fromJson(json.decode(jsonStr))
          : new VoteSub.fromJson(jsonStr);

  VoteSub.fromJson(jsonRes) {
    id = jsonRes['id'];
    optionIds = jsonRes['optionIds'] == null ? null : [];

    for (var optionIdsItem in optionIds == null ? [] : jsonRes['optionIds']) {
      optionIds.add(optionIdsItem);
    }
  }

  @override
  String toString() {
    return '{"id": ${id != null ? '${json.encode(id)}' : 'null'},"optionIds":'
        ' $optionIds}';
  }
}
