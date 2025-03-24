// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorResponseDto _$AuthorResponseDtoFromJson(Map<String, dynamic> json) =>
    AuthorResponseDto(
      memberId: (json['memberId'] as num).toInt(),
      nickname: json['nickname'] as String,
      mbti: json['mbti'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
    );

Map<String, dynamic> _$AuthorResponseDtoToJson(AuthorResponseDto instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'nickname': instance.nickname,
      'mbti': instance.mbti,
      'profileImageUrl': instance.profileImageUrl,
    };
