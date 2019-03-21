import 'package:json_annotation/json_annotation.dart';

part 'vote_sub_model.g.dart';

@JsonSerializable()
class VoteSubModel extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'optionIds')
  List<String> optionIds;

  VoteSubModel(this.id,
      this.optionIds,);

  factory VoteSubModel.fromJson(Map<String, dynamic> srcJson) =>
      _$VoteSubModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VoteSubModelToJson(this);
}
