import 'package:are_you_t_flutter/features/post/data/data_source/post_data_source.dart';
import 'package:are_you_t_flutter/features/post/data/dto/create_post_request_dto.dart';
import 'package:are_you_t_flutter/features/post/domain/entity/post_entity.dart';
import 'package:are_you_t_flutter/features/post/domain/repository/post_repository.dart';
import 'package:logger/logger.dart';
import '../dto/update_post_request_dto.dart';
import '../dto/update_post_status_request_dto.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource dataSource;
  final logger = Logger();

  PostRepositoryImpl({required this.dataSource});

  @override
  Future<List<PostEntity>> fetchPosts(int page, int size) async {
    final dtoList = await dataSource.fetchPosts(page: page, size: size);
    return dtoList.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<PostEntity?> fetchPostById(int postId) async {
    logger.i("[Repository] fetchPostById: postId=$postId");

    final dto = await dataSource.fetchPostDetail(postId);
    final entity = dto.toEntity();

    logger.d("[Repository] PostEntity created: ${entity.title}");
    return entity;
  }

  @override
  Future<PostEntity> createPost(PostEntity post) async{
    final request = CreatePostRequestDto(title: post.title, content: post.content);
    final response = await dataSource.createPost(request, post.memberId);
    return response.toEntity();
  }

  @override
  Future<void> deletePost(int id) async {
    await dataSource.deletePost(id);
  }

  // @override
  // Future<void> likePost(int postId) async {
  //   final request = PostLikeRequestDto(postId: postId);
  //   await dataSource.likePost(request);
  // }

  @override
  Future<void> updatePost(PostEntity post) async {
    final request = UpdatePostRequestDto(
      title: post.title,
      content: post.content,
    );
    await dataSource.updatePost(post.id, request);
  }

  // 선택적으로 상태 업데이트 함수도 추가 가능
  Future<void> updatePostStatus(int postId, String newStatus) async {
    final request = UpdatePostStatusRequestDto(status: newStatus);
    await dataSource.updatePostStatus(postId, request);
  }
}