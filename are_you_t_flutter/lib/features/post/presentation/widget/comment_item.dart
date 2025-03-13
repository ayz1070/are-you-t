import 'package:flutter/material.dart';
import 'package:are_you_t_flutter/core/theme/app_colors.dart';
import 'package:are_you_t_flutter/core/theme/app_text_styles.dart';

class CommentItem extends StatelessWidget {
  final String profileImageUrl;
  final String nickname;
  final String mbti;
  final String content;
  final String createdAt;
  final int likes;
  final VoidCallback onLikePressed;
  final VoidCallback onReplyPressed;

  const CommentItem({
    super.key,
    required this.profileImageUrl,
    required this.nickname,
    required this.mbti,
    required this.content,
    required this.createdAt,
    required this.likes,
    required this.onLikePressed,
    required this.onReplyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 프로필 이미지
              CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
              SizedBox(width: 8),
              Text(nickname, style: AppTextStyles.name1),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  mbti,
                  style: AppTextStyles.caption.copyWith(color: AppColors.primary),
                ),
              ),

              const SizedBox(width: 8),

            ],
          ),
          const SizedBox(height: 6),
          // 댓글 내용
          Text(content, style: AppTextStyles.comment1),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // 좋아요 버튼
              Column(
                children: [
                  Icon(Icons.favorite_border, size: 20, color: Colors.grey),
                  Text("$likes", style: AppTextStyles.caption),
                ],
              ),

              const SizedBox(width: 24),
              // 대댓글 버튼
              Column(
                children: [
                  Icon(Icons.chat_bubble_outline, size: 20, color: Colors.grey),
                  Text("$likes", style: AppTextStyles.caption),
                ],
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}