class CommentEntity {
  final int id;
  final int postId;
  final int memberId;
  final int? parentCommentId;
  final String content;
  final String authorNickname;
  final int likes;
  final CommentStatus status;
  final bool isEdited;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  CommentEntity({
    required this.id,
    required this.postId,
    required this.memberId,
    this.parentCommentId,
    required this.content,
    required this.authorNickname,
    this.likes = 0,
    this.status = CommentStatus.visible,
    this.isEdited = false,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  CommentEntity copyWith({
    int? id,
    int? postId,
    int? memberId,
    int? parentCommentId,
    String? content,
    String? authorNickname,
    int? likes,
    CommentStatus? status,
    bool? isEdited,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return CommentEntity(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      memberId: memberId ?? this.memberId,
      parentCommentId: parentCommentId ?? this.parentCommentId,
      content: content ?? this.content,
      authorNickname: authorNickname ?? this.authorNickname,
      likes: likes ?? this.likes,
      status: status ?? this.status,
      isEdited: isEdited ?? this.isEdited,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}

enum CommentStatus { visible, deleted }