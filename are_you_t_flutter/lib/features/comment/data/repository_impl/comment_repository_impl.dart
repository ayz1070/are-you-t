import 'dart:async';
import 'package:are_you_t_flutter/features/comment/data/data_source/comment_data_source.dart';
import 'package:are_you_t_flutter/features/comment/data/dto/create_comment_request_dto.dart';
import '../../domain/entity/comment_entity.dart';
import '../../domain/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource commentDataSource;

  CommentRepositoryImpl({required this.commentDataSource});

  @override
  Future<List<CommentEntity>> fetchCommentsByPostId(int postId) async {
    final dtoList = await commentDataSource.fetchCommentsByPost(postId);
    return dtoList.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<void> createComment(CommentEntity comment) async {
    final request = CreateCommentRequestDto(
      content: comment.content,
      parentCommentId: comment.parentCommentId,
    );

    await commentDataSource.createComment(
      postId: comment.postId,
      memberId: comment.memberId,
      request: request,
    );
  }

  @override
  Future<void> updateComment(CommentEntity comment) async {
    // 추후 UpdateCommentRequestDto 생성 후 구현 가능
    throw UnimplementedError();
  }

  @override
  Future<void> deleteComment(int commentId) async {
    await commentDataSource.deleteComment(commentId);
  }

  @override
  Future<void> likeComment(int commentId, int memberId) async {
    throw UnimplementedError(); // 구현 예정
  }

  @override
  Future<void> unlikeComment(int commentId, int memberId) async {
    throw UnimplementedError(); // 구현 예정
  }

  @override
  Future<CommentEntity?> fetchCommentById(int commentId) async {
    // API에서 제공 시 구현
    throw UnimplementedError();
  }
}