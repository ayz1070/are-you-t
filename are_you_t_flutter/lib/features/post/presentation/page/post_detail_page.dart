import 'package:are_you_t_flutter/core/widget/common_app_bar.dart';
import 'package:are_you_t_flutter/features/post/domain/entity/post_entity.dart';
import 'package:are_you_t_flutter/features/post/domain/entity/post_status.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class PostDetailPage extends ConsumerWidget {
  final logger = Logger();
  final post = PostEntity(
    id: "1",
    memberId: "1",
    title: "테스트 제목",
    content: "테스트 내용",
    likes: 12,
    status: PostStatus.visible,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(), // 예제 이미지 URL

  );

  final comments = ["댓글1","댓글2","댓글3"];

  PostDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CommonAppBar(title: "게시글 상세"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ 프로필 정보
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage("https://via.placeholder.com/100"),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "사용자 닉네임",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "MBTI: ENFP",
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ✅ 게시글 제목
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // ✅ 게시글 내용
            Text(
              post.content,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // ✅ 이미지 캐러셀 (이미지가 있을 경우에만 표시)
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
                  child: Image.network("https://picsum.photos/200/300", fit: BoxFit.cover, width: double.infinity),
                );
              }).toList(),
            )
                : const SizedBox(height: 20), // 이미지가 없을 경우 공백 유지
            const SizedBox(height: 16),

            // ✅ 좋아요 및 댓글 개수
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('❤️ ${post.likes} 좋아요', style: const TextStyle(fontSize: 16)),
                Text('💬 ${comments!.length} 댓글', style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 12),

            // ✅ 댓글 리스트
            const Divider(),
            const Text("댓글", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: comments?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage("https://via.placeholder.com/80"),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(comments![index]),
                          ),
                        ),
                      ],
                    ),
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