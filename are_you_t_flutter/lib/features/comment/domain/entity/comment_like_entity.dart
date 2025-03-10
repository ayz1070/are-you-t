class CommentLikeEntity {
  final String commentId;
  final String memberId;
  final DateTime createdAt;

  CommentLikeEntity({
    required this.commentId,
    required this.memberId,
    required this.createdAt,
  });
}