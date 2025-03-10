import 'package:are_you_t_flutter/features/post/domain/entity/post_image_entity.dart';
import 'package:are_you_t_flutter/features/post/domain/entity/post_status.dart';

class PostEntity {
  final String id;
  final String memberId;
  final String title;
  final String content;
  final int likes;
  final PostStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final List<PostImageEntity> images; // 이미지 리스트 포함

  PostEntity({
    required this.id,
    required this.memberId,
    required this.title,
    required this.content,
    required this.likes,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.images = const [],
  });

  PostEntity copyWith({
    String? id,
    String? memberId,
    String? title,
    String? content,
    int? likes,
    PostStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    List<PostImageEntity>? images,
  }) {
    return PostEntity(
      id: id ?? this.id,
      memberId: memberId ?? this.memberId,
      title: title ?? this.title,
      content: content ?? this.content,
      likes: likes ?? this.likes,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      images: images ?? this.images,
    );
  }
}