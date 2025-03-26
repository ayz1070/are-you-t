import 'dart:io';

import 'package:are_you_t_flutter/core/widget/common_app_bar.dart';
import 'package:are_you_t_flutter/core/widget/common_fab.dart';
import 'package:are_you_t_flutter/features/post/presentation/widget/post_image_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/post_module.dart';
import '../../domain/entity/post_entity.dart';
import '../../domain/entity/post_status.dart';
import '../widget/post_title_text_field.dart';
import '../widget/post_content_text_field.dart';

class PostCreatePage extends ConsumerStatefulWidget {
  const PostCreatePage({Key? key}) : super(key: key);

  @override
  ConsumerState<PostCreatePage> createState() => _PostCreatePageState();
}

class _PostCreatePageState extends ConsumerState<PostCreatePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postCreateViewModelProvider);

    return Scaffold(
      appBar: CommonAppBar(title: "글 쓰기"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostTitleTextField(controller: _titleController),
            const Divider(), // 제목과 내용 구분선 추가
            PostContentTextField(controller: _contentController),

            const SizedBox(height: 12),

            PostImageListView(),
          ],
        ),
      ),
      floatingActionButton: CommonFab(
        onPressed: () async {
          final viewModel = ref.read(postCreateViewModelProvider.notifier);

          final createdPost = await viewModel.submitPost(
            title: _titleController.text,
            content: _contentController.text,
            memberId: 1,
          );

          if (createdPost == null) {
            _showError("게시글 작성에 실패했습니다");
            return;
          }

          ref.read(postListViewModelProvider.notifier).addPost(createdPost);
          context.pop(true);
        },
        icon: Icons.check,
        tooltip: "완료",
      ),
    );
  }
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }


}