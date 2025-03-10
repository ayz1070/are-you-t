import '../repository/comment_repository.dart';

class UnlikeCommentUseCase {
  final CommentRepository repository;

  UnlikeCommentUseCase(this.repository);

  Future<void> call(String commentId, String memberId) async {
    await repository.unlikeComment(commentId, memberId);
  }
}