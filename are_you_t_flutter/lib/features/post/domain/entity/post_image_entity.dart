import 'package:are_you_t_flutter/features/post/domain/entity/post_image_status.dart';

class PostImageEntity {
  final String id;
  final String postId;
  final String imageUrl;
  final PostImageStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;

  PostImageEntity({
    required this.id,
    required this.postId,
    required this.imageUrl,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  PostImageEntity copyWith({
    String? id,
    String? postId,
    String? imageUrl,
    PostImageStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PostImageEntity(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      imageUrl: imageUrl ?? this.imageUrl,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}