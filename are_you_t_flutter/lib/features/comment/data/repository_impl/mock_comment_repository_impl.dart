import 'dart:async';
import '../../domain/entity/comment_entity.dart';
import '../../domain/repository/comment_repository.dart';

class MockCommentRepositoryImpl implements CommentRepository {
  final List<CommentEntity> _mockComments = List.generate(
    10,
        (index) => CommentEntity(
      id: index.toString(),
      postId: 'post_${index % 3}', // 3개의 게시글에 대한 댓글
      memberId: 'user_$index',
      parentCommentId: index % 4 == 0 ? null : '${index - 1}', // 대댓글 구조
      content: '이것은 댓글 $index 입니다.',
      likes: index * 2,
      status: CommentStatus.visible,
      isEdited: index % 2 == 0,
      createdAt: DateTime.now().subtract(Duration(minutes: index * 3)),
      updatedAt: DateTime.now(),
      deletedAt: null,
    ),
  );

  @override
  Future<List<CommentEntity>> fetchCommentsByPostId(String postId) async {
    await Future.delayed(const Duration(milliseconds: 100)); // 네트워크 요청 시뮬레이션
    return _mockComments.where((comment) => comment.postId == postId).toList();
  }

  @override
  Future<void> createComment(CommentEntity comment) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _mockComments.add(comment);
  }

  @override
  Future<void> updateComment(CommentEntity comment) async {
    final index = _mockComments.indexWhere((c) => c.id == comment.id);
    if (index != -1) {
      _mockComments[index] = comment.copyWith(isEdited: true);
    }
  }

  @override
  Future<void> deleteComment(String commentId) async {
    final index = _mockComments.indexWhere((c) => c.id == commentId);
    if (index != -1) {
      _mockComments[index] = _mockComments[index].copyWith(
        status: CommentStatus.deleted,
        deletedAt: DateTime.now(),
      );
    }
  }

  @override
  Future<void> likeComment(String commentId, String memberId) async {
    final index = _mockComments.indexWhere((c) => c.id == commentId);
    if (index != -1) {
      _mockComments[index] = _mockComments[index].copyWith(likes: _mockComments[index].likes + 1);
    }
  }

  @override
  Future<void> unlikeComment(String commentId, String memberId) async {
    final index = _mockComments.indexWhere((c) => c.id == commentId);
    if (index != -1 && _mockComments[index].likes > 0) {
      _mockComments[index] = _mockComments[index].copyWith(likes: _mockComments[index].likes - 1);
    }
  }

  @override
  Future<CommentEntity?> fetchCommentById(String commentId) {
    // TODO: implement fetchCommentById
    throw UnimplementedError();
  }
}