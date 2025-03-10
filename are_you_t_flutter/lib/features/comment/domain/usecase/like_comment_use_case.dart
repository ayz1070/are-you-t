import '../repository/comment_repository.dart';

class LikeCommentUseCase {
  final CommentRepository repository;

  LikeCommentUseCase(this.repository);

  Future<void> call(String commentId, String memberId) async {
    await repository.likeComment(commentId, memberId);
  }
}
