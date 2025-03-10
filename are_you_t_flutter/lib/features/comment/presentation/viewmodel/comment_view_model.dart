import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../domain/entity/comment_entity.dart';
import '../../domain/usecase/create_comment_use_case.dart';
import '../../domain/usecase/fetch_comment_by_post_id_use_case.dart';
import '../../domain/usecase/update_comment_use_case.dart';
import '../../domain/usecase/delete_comment_use_case.dart';
import '../../domain/usecase/like_comment_use_case.dart';
import '../../domain/usecase/unlike_comment_use_case.dart';
import '../state/comment_state.dart';



class CommentViewModel extends StateNotifier<CommentState> {
  final FetchCommentsByPostIdUseCase fetchCommentsByPostIdUseCase;
  final CreateCommentUseCase createCommentUseCase;
  final UpdateCommentUseCase updateCommentUseCase;
  final DeleteCommentUseCase deleteCommentUseCase;
  final LikeCommentUseCase likeCommentUseCase;
  final UnlikeCommentUseCase unlikeCommentUseCase;

  final Logger logger = Logger();

  CommentViewModel(
      this.fetchCommentsByPostIdUseCase,
      this.createCommentUseCase,
      this.updateCommentUseCase,
      this.deleteCommentUseCase,
      this.likeCommentUseCase,
      this.unlikeCommentUseCase,
      ) : super(CommentState());

  Future<void> fetchComments(String postId) async {
    state = state.copyWith(isLoading: true);
    try {
      final comments = await fetchCommentsByPostIdUseCase.call(postId);
      state = state.copyWith(comments: comments, isLoading: false);
      logger.i("✅ 댓글 불러오기 성공: ${comments.length}개");
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      logger.e("🚨 댓글 불러오기 실패: $e");
    }
  }

  Future<void> addComment(CommentEntity comment) async {
    try {
      await createCommentUseCase.call(comment);
      state = state.copyWith(comments: [comment, ...state.comments]);
      logger.i("✅ 댓글 추가 성공: ${comment.content}");
    } catch (e) {
      logger.e("🚨 댓글 추가 실패: $e");
    }
  }

  Future<void> updateComment(CommentEntity comment) async {
    try {
      await updateCommentUseCase.call(comment);
      final updatedComments = state.comments.map((c) {
        return c.id == comment.id ? comment : c;
      }).toList();
      state = state.copyWith(comments: updatedComments);
      logger.i("✅ 댓글 수정 성공: ${comment.content}");
    } catch (e) {
      logger.e("🚨 댓글 수정 실패: $e");
    }
  }

  Future<void> deleteComment(String commentId) async {
    try {
      await deleteCommentUseCase.call(commentId);
      state = state.copyWith(comments: state.comments.where((c) => c.id != commentId).toList());
      logger.i("✅ 댓글 삭제 성공: $commentId");
    } catch (e) {
      logger.e("🚨 댓글 삭제 실패: $e");
    }
  }

  Future<void> likeComment(String commentId, String memberId) async {
    try {
      await likeCommentUseCase.call(commentId, memberId);
      final updatedComments = state.comments.map((c) {
        return c.id == commentId ? c.copyWith(likes: c.likes + 1) : c;
      }).toList();
      state = state.copyWith(comments: updatedComments);
      logger.i("✅ 좋아요 성공: $commentId");
    } catch (e) {
      logger.e("🚨 좋아요 실패: $e");
    }
  }

  Future<void> unlikeComment(String commentId, String memberId) async {
    try {
      await unlikeCommentUseCase.call(commentId, memberId);
      final updatedComments = state.comments.map((c) {
        return c.id == commentId ? c.copyWith(likes: c.likes - 1) : c;
      }).toList();
      state = state.copyWith(comments: updatedComments);
      logger.i("✅ 좋아요 취소 성공: $commentId");
    } catch (e) {
      logger.e("🚨 좋아요 취소 실패: $e");
    }
  }
}