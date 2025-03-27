import 'package:are_you_t_flutter/core/di/post_module.dart';
import 'package:are_you_t_flutter/core/theme/app_text_styles.dart';
import 'package:are_you_t_flutter/core/widget/common_app_bar.dart';
import 'package:are_you_t_flutter/features/post/domain/entity/post_entity.dart';
import 'package:are_you_t_flutter/features/post/domain/entity/post_status.dart';
import 'package:are_you_t_flutter/features/post/presentation/widget/comment_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class PostDetailPage extends ConsumerStatefulWidget {
  final int postId;
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
    Future.microtask((){
      ref.read(postDetailViewModelProvider.notifier).fetchPostById(widget.postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postDetailViewModelProvider);
    final viewModel = ref.read(postDetailViewModelProvider.notifier);
    final post = state.post!;

    return Scaffold(
      appBar: CommonAppBar(title: "게시글 상세"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 프로필 정보
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage:
                      NetworkImage("https://picsum.photos/200/300"),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "철수킴",
                      style: AppTextStyles.body3
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    // MBTI
                    Text(
                      "ENFP",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(width: 8),
                Text(
                  "9시간",
                  style: AppTextStyles.body3.copyWith(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 게시글 제목
            Text(
              post.title,
              style: AppTextStyles.title1,
            ),
            const SizedBox(height: 8),

            // 게시글 내용
            Text(
              post.content,
              style: AppTextStyles.content1,
            ),
            const SizedBox(height: 16),
            // 이미지 캐러셀 (이미지가 있을 경우에만 표시)
            post.images != null && post.images!.isNotEmpty
                ? CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                    ),
                    items: post.images!.map((imageUrl) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network("https://picsum.photos/200/300",
                            fit: BoxFit.cover, width: double.infinity),
                      );
                    }).toList(),
                  )
                : const SizedBox(height: 20), // 이미지가 없을 경우 공백 유지
            const SizedBox(height: 16),

            // 좋아요 및 댓글 개수
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.favorite_border_outlined,
                      size: 24,
                    ),
                    Text('${post.likes}',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  width: 24,
                ),
                Column(
                  children: [
                    Icon(Icons.chat_bubble_outline, size: 24),
                    Text('${widget.comments.length}',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),

            // ✅ 댓글 리스트
            const Divider(),
            const SizedBox(height: 10),
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
    );
  }
}
