import 'package:flutter/foundation.dart';
import '../../domain/entity/comment_entity.dart';

class CommentState {
  final List<CommentEntity> comments;
  final bool isLoading;
  final String? errorMessage;

  CommentState({
    this.comments = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  CommentState copyWith({
    List<CommentEntity>? comments,
    bool? isLoading,
    String? errorMessage,
  }) {
    return CommentState(
      comments: comments ?? this.comments,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}