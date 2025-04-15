import '../repository/comment_repository.dart';

class DeleteCommentUseCase {
  final CommentRepository repository;

  DeleteCommentUseCase(this.repository);

  Future<void> call(int commentId) async {
    await repository.deleteComment(commentId);
  }
}