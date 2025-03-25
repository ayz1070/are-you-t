// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePostRequestDto _$CreatePostRequestDtoFromJson(
        Map<String, dynamic> json) =>
    CreatePostRequestDto(
      title: json['title'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$CreatePostRequestDtoToJson(
        CreatePostRequestDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
    };
