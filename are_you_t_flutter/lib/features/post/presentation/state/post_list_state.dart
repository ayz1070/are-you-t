import '../../domain/entity/post_entity.dart';

class PostListState {
  final List<PostEntity> posts;
  final bool isLoading;
  final String? errorMessage;

  PostListState({
    this.posts = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  PostListState copyWith({
    List<PostEntity>? posts,
    bool? isLoading,
    String? errorMessage,
  }) {
    return PostListState(
      posts: posts ?? this.posts,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}