import '../entity/comment_entity.dart';
import '../repository/comment_repository.dart';

class FetchCommentsByPostIdUseCase {
  final CommentRepository repository;

  FetchCommentsByPostIdUseCase(this.repository);

  Future<List<CommentEntity>> call(int postId) async {
    return await repository.fetchCommentsByPostId(postId);
  }
}