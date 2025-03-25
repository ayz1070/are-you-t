// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_like_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostLikeRequestDto _$PostLikeRequestDtoFromJson(Map<String, dynamic> json) =>
    PostLikeRequestDto(
      postId: (json['postId'] as num).toInt(),
      memberId: (json['memberId'] as num).toInt(),
    );

Map<String, dynamic> _$PostLikeRequestDtoToJson(PostLikeRequestDto instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'memberId': instance.memberId,
    };
