import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/post_entity.dart';
import '../../domain/usecase/create_post_use_case.dart';
import '../state/post_create_state.dart';

class PostCreateViewModel extends StateNotifier<PostCreateState> {
  final CreatePostUseCase createPostUseCase;

  PostCreateViewModel(this.createPostUseCase) : super(PostCreateState());

  Future<void> createPost(PostEntity post) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await createPostUseCase.call(post);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

