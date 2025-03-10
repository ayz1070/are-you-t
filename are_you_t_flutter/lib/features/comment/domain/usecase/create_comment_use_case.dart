import '../entity/comment_entity.dart';
import '../repository/comment_repository.dart';

class CreateCommentUseCase {
  final CommentRepository repository;

  CreateCommentUseCase(this.repository);

  Future<void> call(CommentEntity comment) async {
    await repository.createComment(comment);
  }
}