import '../../domain/entity/comment_entity.dart';

class CommentResponseDto {
  final int id;
  final int postId;
  final int? parentCommentId;
  final String content;
  final String authorNickname;
  final bool isEdited;
  final String status;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  CommentResponseDto({
    required this.id,
    required this.postId,
    this.parentCommentId,
    required this.content,
    required this.authorNickname,
    required this.isEdited,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory CommentResponseDto.fromJson(Map<String, dynamic> json) {
    return CommentResponseDto(
      id: json['id'],
      postId: json['postId'],
      parentCommentId: json['parentCommentId'],
      content: json['content'],
      authorNickname: json['authorNickname'],
      isEdited: json['isEdited'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
    );
  }

  factory CommentEntity toEntity() {
    return CommentEntity(
      id: id,
      postId: postId,
      parentCommentId: parentCommentId,
      memberId: 0, // 필요 시 response에 추가
      content: content,
      authorNickname: authorNickname,
      isEdited: isEdited,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}