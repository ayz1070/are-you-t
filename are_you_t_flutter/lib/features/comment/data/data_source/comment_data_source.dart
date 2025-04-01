import '../dto/comment_response_dto.dart';
import '../dto/create_comment_request_dto.dart';

abstract class CommentDataSource {
  /// 댓글 생성
  Future<CommentResponseDto> createComment({
    required int postId,
    required int memberId,
    required CreateCommentRequestDto request,
  });

  /// 특정 게시글의 모든 댓글 조회
  Future<List<CommentResponseDto>> fetchCommentsByPost(int postId);

  /// 댓글 삭제
  Future<void> deleteComment(int commentId);

  /// (선택) 댓글 수정
  // Future<CommentResponseDto> updateComment(int commentId, UpdateCommentRequestDto request);
}