import '../../domain/entity/comment_entity.dart';

class CommentResponseDto {
  final int id;
  final int postId;
  final int memberId;
  final int? parentCommentId;
  final String content;
  final String authorNickname;
  final int likes;
  final String status; // 서버에서는 String으로 전달됨 (e.g., "VISIBLE")
  final bool isEdited;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  CommentResponseDto({
    required this.id,
    required this.postId,
    required this.memberId,
    this.parentCommentId,
    required this.content,
    required this.authorNickname,
    required this.likes,
    required this.status,
    required this.isEdited,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  /// JSON → DTO
  factory CommentResponseDto.fromJson(Map<String, dynamic> json) {
    return CommentResponseDto(
      id: json['id'],
      postId: json['postId'],
      memberId: json['memberId'],
      parentCommentId: json['parentCommentId'],
      content: json['content'],
      authorNickname: json['authorNickname'],
      likes: json['likes'] ?? 0,
      status: json['status'],
      isEdited: json['isEdited'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
    );
  }

  /// DTO → Entity 변환
  CommentEntity toEntity() {
    return CommentEntity(
      id: id,
      postId: postId,
      memberId: memberId,
      parentCommentId: parentCommentId,
      content: content,
      authorNickname: authorNickname,
      likes: likes,
      status: _parseStatus(status),
      isEdited: isEdited,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      deletedAt: deletedAt != null ? DateTime.tryParse(deletedAt!) : null,
    );
  }

  /// 문자열 상태 → enum 파싱
  CommentStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'visible':
        return CommentStatus.visible;
      case 'deleted':
        return CommentStatus.deleted;
      default:
        return CommentStatus.visible; // fallback
    }
  }
}