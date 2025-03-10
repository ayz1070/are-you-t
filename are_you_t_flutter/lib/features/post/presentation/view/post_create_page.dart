import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/post_module.dart';
import '../../domain/entity/post_entity.dart';
import '../../domain/entity/post_status.dart';

class PostCreatePage extends ConsumerStatefulWidget {
  const PostCreatePage({Key? key}) : super(key: key);

  @override
  ConsumerState<PostCreatePage> createState() => _PostCreatePageState();
}

class _PostCreatePageState extends ConsumerState<PostCreatePage> {
  final TextEditingController _contentController = TextEditingController();

  Future<void> _submitPost() async {
    final viewModel = ref.read(postCreateViewModelProvider.notifier);

    if (_contentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('게시글 내용을 입력해주세요!')),
      );
      return;
    }

    final newPost = PostEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      memberId: 'user_1',
      content: _contentController.text,
      likes: 0,
      status: PostStatus.visible,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await viewModel.createPost(newPost);
    Navigator.pop(context); // 게시글 작성 후 목록 페이지로 이동
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postCreateViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('게시글 작성')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _contentController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: '내용을 입력하세요...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: state.isLoading ? null : _submitPost,
              child: const Text('게시글 작성'),
            ),
          ],
        ),
      ),
    );
  }
}