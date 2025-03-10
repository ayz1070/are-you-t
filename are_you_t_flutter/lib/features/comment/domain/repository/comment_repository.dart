import '../entity/comment_entity.dart';

abstract class CommentRepository {
  Future<List<CommentEntity>> fetchCommentsByPostId(String postId);
  Future<CommentEntity?> fetchCommentById(String commentId);
  Future<void> createComment(CommentEntity comment);
  Future<void> updateComment(CommentEntity comment);
  Future<void> deleteComment(String commentId);
  Future<void> likeComment(String commentId, String memberId);
  Future<void> unlikeComment(String commentId, String memberId);
}