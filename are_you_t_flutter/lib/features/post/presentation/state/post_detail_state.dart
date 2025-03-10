import '../../domain/entity/post_entity.dart';

class PostDetailState {
  final PostEntity? post;
  final bool isLoading;
  final String? errorMessage;

  PostDetailState({
    this.post,
    this.isLoading = false,
    this.errorMessage,
  });

  PostDetailState copyWith({
    PostEntity? post,
    bool? isLoading,
    String? errorMessage,
  }) {
    return PostDetailState(
      post: post ?? this.post,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}