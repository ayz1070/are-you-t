// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostListResponseDto _$PostListResponseDtoFromJson(Map<String, dynamic> json) =>
    PostListResponseDto(
      postId: (json['postId'] as num).toInt(),
      title: json['title'] as String,
      contentPreview: json['contentPreview'] as String,
      likeCount: (json['likeCount'] as num).toInt(),
      commentCount: (json['commentCount'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      author:
          AuthorResponseDto.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostListResponseDtoToJson(
        PostListResponseDto instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'title': instance.title,
      'contentPreview': instance.contentPreview,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
      'createdAt': instance.createdAt,
      'author': instance.author,
    };
