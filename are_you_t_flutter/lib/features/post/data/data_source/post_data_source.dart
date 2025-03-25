import '../dto/create_post_request_dto.dart';
import '../dto/post_list_response_dto.dart';
import '../dto/post_response_dto.dart';
import '../dto/update_post_request_dto.dart';
import '../dto/update_post_status_request_dto.dart';

abstract class PostDataSource {
  Future<List<PostListResponseDto>> fetchPosts({int page = 0, int size = 10});
  Future<PostListResponseDto> fetchPostDetail(int postId);
  Future<PostResponseDto> createPost(CreatePostRequestDto request, int memberId);
  Future<PostResponseDto> updatePost(int postId, UpdatePostRequestDto request);
  Future<PostResponseDto> updatePostStatus(int postId, UpdatePostStatusRequestDto request);
  Future<void> deletePost(int postId);
}