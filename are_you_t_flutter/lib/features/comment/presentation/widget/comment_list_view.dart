import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/comment_module.dart';
import '../../domain/entity/comment_entity.dart';

class CommentListView extends ConsumerWidget {
  final String postId;

  const CommentListView({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(commentViewModelProvider);
    final viewModel = ref.read(commentViewModelProvider.notifier);

    return Column(
      children: [
        if (state.isLoading) const CircularProgressIndicator(),
        if (state.errorMessage != null) Text("🚨 오류: ${state.errorMessage}"),
        Expanded(
          child: ListView.builder(
            itemCount: state.comments.length,
            itemBuilder: (context, index) {
              final comment = state.comments[index];
              return ListTile(
                title: Text(comment.content),
                subtitle: Text("❤️ ${comment.likes}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up),
                      onPressed: () => viewModel.likeComment(comment.id, "currentUserId"),
                    ),
                    IconButton(
                      icon: const Icon(Icons.thumb_down),
                      onPressed: () => viewModel.unlikeComment(comment.id, "currentUserId"),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => viewModel.deleteComment(comment.id),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: "댓글을 입력하세요...",
              border: OutlineInputBorder(),
            ),
            onSubmitted: (text) {
              if (text.isNotEmpty) {
                viewModel.addComment(CommentEntity(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  postId: postId,
                  memberId: "currentUserId",
                  content: text,
                  likes: 0,
                  status: CommentStatus.visible,
                  isEdited: false,
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                ));
              }
            },
          ),
        ),
      ],
    );
  }
}