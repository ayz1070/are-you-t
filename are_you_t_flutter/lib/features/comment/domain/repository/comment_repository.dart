import '../entity/comment_entity.dart';

abstract class CommentRepository {
  Future<List<CommentEntity>> fetchCommentsByPostId(int postId);
  Future<CommentEntity?> fetchCommentById(int commentId);
  Future<void> createComment(CommentEntity comment);
  Future<void> updateComment(CommentEntity comment);
  Future<void> deleteComment(int commentId);
  Future<void> likeComment(int commentId, int memberId);
  Future<void> unlikeComment(int commentId, int memberId);
}