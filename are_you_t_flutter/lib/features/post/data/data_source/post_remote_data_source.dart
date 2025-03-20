import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../dto/post_list_response_dto.dart';
import 'post_data_source.dart';

class PostRemoteDataSource implements PostDataSource {
  final Dio dio;
  final Logger logger = Logger(); // ✅ Logger 추가

  PostRemoteDataSource({required String baseUrl})
      : dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    responseType: ResponseType.json,
    headers: {'Content-Type': 'application/json'},
  ));

  /// **📌 게시글 목록 조회 (페이징)**
  @override
  Future<List<PostListResponseDto>> fetchPosts({int page = 0, int size = 10}) async {
    try {
      logger.i("📢 Fetching posts: page=$page, size=$size"); // ✅ 요청 로깅

      final response = await dio.get(
        '/api/v1/posts',
        queryParameters: {'page': page, 'size': size},
      );

      logger.d("✅ Response: ${response.data}"); // ✅ 응답 로깅

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => PostListResponseDto.fromJson(json))
            .toList();
      } else {
        throw Exception('게시글 목록을 불러오지 못했습니다.');
      }
    } on DioException catch (e) {
      logger.e("⛔ Error fetching posts: ${e.message}", error: e); // ✅ 에러 로깅
      throw Exception(_handleDioError(e, '게시글 목록 불러오기 실패'));
    }
  }

  /// **📌 단일 게시글 조회**
  @override
  Future<PostListResponseDto> fetchPostDetail(int postId) async {
    try {
      logger.i("📢 Fetching post detail: postId=$postId"); // ✅ 요청 로깅

      final response = await dio.get('/api/v1/posts/$postId');

      logger.d("✅ Response: ${response.data}"); // ✅ 응답 로깅

      if (response.statusCode == 200) {
        return PostListResponseDto.fromJson(response.data);
      } else {
        throw Exception('게시글 정보를 불러오지 못했습니다.');
      }
    } on DioException catch (e) {
      logger.e("⛔ Error fetching post detail: ${e.message}", error: e); // ✅ 에러 로깅
      throw Exception(_handleDioError(e, '게시글 정보 불러오기 실패'));
    }
  }

  /// **📌 에러 핸들링**
  String _handleDioError(DioException e, String defaultMessage) {
    if (e.response != null) {
      switch (e.response?.statusCode) {
        case 400:
          return '$defaultMessage: 잘못된 요청입니다.';
        case 401:
          return '$defaultMessage: 인증되지 않은 사용자입니다.';
        case 403:
          return '$defaultMessage: 권한이 없습니다.';
        case 404:
          return '$defaultMessage: 요청한 데이터를 찾을 수 없습니다.';
        case 500:
          return '$defaultMessage: 서버 오류가 발생했습니다.';
      }
    }
    return '$defaultMessage: ${e.message}';
  }
}