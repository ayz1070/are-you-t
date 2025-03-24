import 'package:are_you_t_flutter/features/post/domain/repository/post_repository.dart';
import 'package:are_you_t_flutter/features/post/domain/usecase/create_post_use_case.dart';
import 'package:are_you_t_flutter/features/post/domain/usecase/fetch_post_by_id_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/post/data/repository_impl/post_repository_impl.dart';
import '../../features/post/domain/usecase/delete_post_use_case.dart';
import '../../features/post/domain/usecase/fetch_posts_use_case.dart';
import '../../features/post/domain/usecase/like_post_use_case.dart';
import '../../features/post/domain/usecase/update_post_use_case.dart';
import '../../features/post/presentation/state/post_create_state.dart';
import '../../features/post/presentation/state/post_detail_state.dart';
import '../../features/post/presentation/state/post_list_state.dart';
import '../../features/post/presentation/viewmodel/post_create_view_model.dart';
import '../../features/post/presentation/viewmodel/post_detail_view_model.dart';
import '../../features/post/presentation/viewmodel/post_list_view_model.dart';



final postRepositoryProvider = Provider<PostRepository>((ref){

});


final createPostUseCaseProvider = Provider<CreatePostUseCase>((ref) {
    return CreatePostUseCase(ref.read(postRepositoryProvider));
});


final deletePostUseCaseProvider = Provider<DeletePostUseCase>((ref) {
    return DeletePostUseCase(ref.read(postRepositoryProvider));
});

final fetchPostByIdUseCaseProvider = Provider<FetchPostByIdUseCase>((ref) {
    return FetchPostByIdUseCase(ref.read(postRepositoryProvider));
});

final fetchPostsUseCaseProvider = Provider<FetchPostsUseCase>((ref) {
    return FetchPostsUseCase(ref.read(postRepositoryProvider));
});

final likePostUseCaseProvider = Provider<LikePostUseCase>((ref) {
    return LikePostUseCase(ref.read(postRepositoryProvider));
});

final updatePostUseCaseProvider = Provider<UpdatePostUseCase>((ref) {
    return UpdatePostUseCase(ref.read(postRepositoryProvider));
});

final postDetailViewModelProvider =
    StateNotifierProvider<PostDetailViewModel, PostDetailState>(
  (ref) => PostDetailViewModel(ref.read(fetchPostByIdUseCaseProvider)),
);

final postCreateViewModelProvider =
    StateNotifierProvider<PostCreateViewModel, PostCreateState>(
  (ref) => PostCreateViewModel(ref.read(createPostUseCaseProvider)),
);

final postListViewModelProvider =
    StateNotifierProvider<PostListViewModel, PostListState>(
  (ref) => PostListViewModel(ref.read(fetchPostsUseCaseProvider)),
);
