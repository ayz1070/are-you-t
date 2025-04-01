class CreateCommentRequestDto {
  final int? parentCommentId;
  final String content;

  CreateCommentRequestDto({this.parentCommentId, required this.content});

  Map<String, dynamic> toJson() => {
    'parentCommentId': parentCommentId,
    'content': content,
  };
}