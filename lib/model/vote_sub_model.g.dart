// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_sub_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoteSubModel _$VoteSubModelFromJson(Map<String, dynamic> json) {
  return VoteSubModel(json['id'] as String,
      (json['optionIds'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$VoteSubModelToJson(VoteSubModel instance) =>
    <String, dynamic>{'id': instance.id, 'optionIds': instance.optionIds};
