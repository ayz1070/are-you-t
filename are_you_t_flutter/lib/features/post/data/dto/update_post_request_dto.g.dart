// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_post_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePostRequestDto _$UpdatePostRequestDtoFromJson(
        Map<String, dynamic> json) =>
    UpdatePostRequestDto(
      title: json['title'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$UpdatePostRequestDtoToJson(
        UpdatePostRequestDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
    };
