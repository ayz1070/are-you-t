import 'package:are_you_t_flutter/features/comment/data/data_source/comment_data_source.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../dto/comment_response_dto.dart';
import '../dto/create_comment_request_dto.dart';

class CommentRemoteDataSource implements CommentDataSource {
  final Dio dio;
  final Logger logger = Logger();

  CommentRemoteDataSource({required String baseUrl})
      : dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {'Content-Type': 'application/json'},
  ));

  /// 댓글 생성
  Future<CommentResponseDto> createComment({
    required int postId,
    required int memberId,
    required CreateCommentRequestDto request,
  }) async {
    try {
      logger.i("📨 Creating comment for postId=$postId, memberId=$memberId");

      final response = await dio.post(
        '/api/v1/comments',
        queryParameters: {
          'postId': postId,
          'memberId': memberId,
        },
        data: request.toJson(),
      );

      logger.d("✅ Response: ${response.data}");

      if (response.statusCode == 200) {
        return CommentResponseDto.fromJson(response.data);
      } else {
        throw Exception('댓글 작성 실패');
      }
    } on DioException catch (e) {
      logger.e("❌ Error creating comment", error: e);
      throw Exception(_handleError(e));
    }
  }

  /// 특정 게시글의 모든 댓글 조회
  Future<List<CommentResponseDto>> fetchCommentsByPost(int postId) async {
    try {
      logger.i("📥 Fetching comments for postId=$postId");

      final response = await dio.get('/api/v1/comments/post/$postId');

      logger.d("✅ Response: ${response.data}");

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => CommentResponseDto.fromJson(json))
            .toList();
      } else {
        throw Exception('댓글 조회 실패');
      }
    } on DioException catch (e) {
      logger.e("❌ Error fetching comments", error: e);
      throw Exception(_handleError(e));
    }
  }

  /// 댓글 삭제
  Future<void> deleteComment(int commentId) async {
    try {
      logger.i("🗑 Deleting comment id=$commentId");

      final response = await dio.delete('/api/v1/comments/$commentId');

      if (response.statusCode != 204) {
        throw Exception('댓글 삭제 실패');
      }
    } on DioException catch (e) {
      logger.e("❌ Error deleting comment", error: e);
      throw Exception(_handleError(e));
    }
  }

  String _handleError(DioException e) {
    if (e.response != null) {
      switch (e.response?.statusCode) {
        case 400:
          return '잘못된 요청입니다.';
        case 401:
          return '인증이 필요합니다.';
        case 403:
          return '권한이 없습니다.';
        case 404:
          return '데이터를 찾을 수 없습니다.';
        case 500:
          return '서버 오류입니다.';
      }
    }
    return '네트워크 오류: ${e.message}';
  }
}