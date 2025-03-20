import '../dto/post_list_response_dto.dart';

abstract class PostDataSource {
  Future<List<PostListResponseDto>> fetchPosts({int page = 0, int size = 10});
  Future<PostListResponseDto> fetchPostDetail(int postId);
}