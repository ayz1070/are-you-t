// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_like_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostLikeResponseDto _$PostLikeResponseDtoFromJson(Map<String, dynamic> json) =>
    PostLikeResponseDto(
      isLiked: json['isLiked'] as bool,
      likeCount: (json['likeCount'] as num).toInt(),
    );

Map<String, dynamic> _$PostLikeResponseDtoToJson(
        PostLikeResponseDto instance) =>
    <String, dynamic>{
      'isLiked': instance.isLiked,
      'likeCount': instance.likeCount,
    };
