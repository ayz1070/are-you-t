import 'package:are_you_t_flutter/core/di/post_module.dart';
import 'package:are_you_t_flutter/core/theme/app_text_styles.dart';
import 'package:are_you_t_flutter/core/widget/common_app_bar.dart';
import 'package:are_you_t_flutter/features/post/domain/entity/post_entity.dart';
import 'package:are_you_t_flutter/features/post/domain/entity/post_status.dart';
import 'package:are_you_t_flutter/features/post/presentation/widget/comment_input_text_field.dart';
import 'package:are_you_t_flutter/features/post/presentation/widget/comment_item.dart';
import 'package:are_you_t_flutter/features/post/presentation/widget/post_detail_profile_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class PostDetailPage extends ConsumerStatefulWidget {
  final int postId;
  final commentController = TextEditingController();
  final logger = Logger();
  final comments = ["댓글1", "댓글2", "댓글3"];

  PostDetailPage({Key? key, required this.postId}) : super(key: key);

  @override
  ConsumerState<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends ConsumerState<PostDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(postDetailViewModelProvider.notifier)
          .fetchPostById(widget.postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postDetailViewModelProvider);
    final post = state.post!;

    return Scaffold(
      appBar: CommonAppBar(title: "게시글 상세"),
      resizeToAvoidBottomInset: true, // 키보드 대응
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostDetailProfileCard(
                nickname: "철수킴", mbti: "mbti", createdAt: "createdAt"),
            const SizedBox(height: 16),
            Text(post.title, style: AppTextStyles.title1),
            const SizedBox(height: 8),
            Text(post.content, style: AppTextStyles.content1),
            const SizedBox(height: 16),
            post.images.isNotEmpty
                ? CarouselSlider(
              options: CarouselOptions(
                height: 200,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
              ),
              items: post.images.map((imageUrl) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://picsum.photos/200/300",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
            )
                : const SizedBox(height: 20),
            const SizedBox(height: 16),
            Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.favorite_border_outlined, size: 24),
                    Text('${post.likes}',
                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(width: 24),
                Column(
                  children: [
                    Icon(Icons.chat_bubble_outline, size: 24),
                    Text('${widget.comments.length}',
                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),

            // 댓글 리스트
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CommentItem(
                    profileImageUrl: "https://picsum.photos/200/300",
                    nickname: "김철수",
                    mbti: "INTP",
                    content: "좋아요~!!",
                    createdAt: "9시간 전",
                    likes: 10,
                    onLikePressed: () {},
                    onReplyPressed: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // 댓글 입력창을 하단에 고정
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets, // 키보드 올라올 때 padding 조정
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
          child: CommentInputField(
            controller: widget.commentController,
            onSubmit: () {
              // 댓글 전송 로직
              widget.commentController.clear();
            },
          ),
        ),
      ),
    );
  }
}
