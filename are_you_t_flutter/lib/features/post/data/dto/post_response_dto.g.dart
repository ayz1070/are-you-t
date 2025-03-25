// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResponseDto _$PostResponseDtoFromJson(Map<String, dynamic> json) =>
    PostResponseDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      likeCount: (json['likeCount'] as num).toInt(),
      commentCount: (json['commentCount'] as num).toInt(),
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      author:
          AuthorResponseDto.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostResponseDtoToJson(PostResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'author': instance.author,
    };
