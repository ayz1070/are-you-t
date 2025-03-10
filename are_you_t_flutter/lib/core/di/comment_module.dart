// 🔹 2. CommentRepository (리포지토리)
import 'package:are_you_t_flutter/features/comment/data/repository_impl/mock_comment_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/comment/domain/repository/comment_repository.dart';
import '../../features/comment/domain/usecase/create_comment_use_case.dart';
import '../../features/comment/domain/usecase/delete_comment_use_case.dart';
import '../../features/comment/domain/usecase/fetch_comment_by_post_id_use_case.dart';
import '../../features/comment/domain/usecase/like_comment_use_case.dart';
import '../../features/comment/domain/usecase/unlike_comment_use_case.dart';
import '../../features/comment/domain/usecase/update_comment_use_case.dart';
import '../../features/comment/presentation/state/comment_state.dart';
import '../../features/comment/presentation/viewmodel/comment_view_model.dart';

final commentRepositoryProvider = Provider<CommentRepository>(
      (ref) => MockCommentRepositoryImpl(),
);

// 🔹 3. UseCases (유즈케이스)
final fetchCommentsByPostIdUseCaseProvider = Provider<FetchCommentsByPostIdUseCase>(
      (ref) => FetchCommentsByPostIdUseCase(ref.read(commentRepositoryProvider)),
);

final createCommentUseCaseProvider = Provider<CreateCommentUseCase>(
      (ref) => CreateCommentUseCase(ref.read(commentRepositoryProvider)),
);

final updateCommentUseCaseProvider = Provider<UpdateCommentUseCase>(
      (ref) => UpdateCommentUseCase(ref.read(commentRepositoryProvider)),
);

final deleteCommentUseCaseProvider = Provider<DeleteCommentUseCase>(
      (ref) => DeleteCommentUseCase(ref.read(commentRepositoryProvider)),
);

final likeCommentUseCaseProvider = Provider<LikeCommentUseCase>(
      (ref) => LikeCommentUseCase(ref.read(commentRepositoryProvider)),
);

final unlikeCommentUseCaseProvider = Provider<UnlikeCommentUseCase>(
      (ref) => UnlikeCommentUseCase(ref.read(commentRepositoryProvider)),
);

// 🔹 4. ViewModel (StateNotifierProvider)
final commentViewModelProvider = StateNotifierProvider<CommentViewModel, CommentState>(
      (ref) => CommentViewModel(
    ref.read(fetchCommentsByPostIdUseCaseProvider),
    ref.read(createCommentUseCaseProvider),
    ref.read(updateCommentUseCaseProvider),
    ref.read(deleteCommentUseCaseProvider),
    ref.read(likeCommentUseCaseProvider),
    ref.read(unlikeCommentUseCaseProvider),
  ),
);