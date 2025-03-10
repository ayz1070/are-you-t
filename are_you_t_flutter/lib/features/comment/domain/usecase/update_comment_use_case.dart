import '../entity/comment_entity.dart';
import '../repository/comment_repository.dart';

class UpdateCommentUseCase {
  final CommentRepository repository;

  UpdateCommentUseCase(this.repository);

  Future<void> call(CommentEntity comment) async {
    await repository.updateComment(comment.copyWith(
      isEdited: true,
      updatedAt: DateTime.now(),
    ));
  }
}