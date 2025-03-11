import 'package:flutter/material.dart';
import 'package:are_you_t_flutter/core/theme/app_text_styles.dart';
import 'package:are_you_t_flutter/core/theme/app_colors.dart';

class PostItem extends StatelessWidget {
  final String profileImageUrl;
  final String nickname;
  final String mbti;
  final String title;
  final String content;
  final String createdAt;
  final int likes;
  final int comments;
  final VoidCallback onTap;

  const PostItem({
    super.key,
    required this.profileImageUrl,
    required this.nickname,
    required this.mbti,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.likes,
    required this.comments,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileImageUrl),
                  radius: 13,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          nickname,
                          style: AppTextStyles.body4,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          createdAt,
                          style: AppTextStyles.caption,
                        ),
                      ],
                    ),
                    Text(
                      mbti,
                      style: AppTextStyles.body4
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: AppTextStyles.body2.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              content,
              style: AppTextStyles.body3.copyWith(color: AppColors.textSecondary),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),

            // 좋아요, 댓글, 조회수
            Row(
              children: [
                Icon(Icons.favorite_border,
                    size: 16, color: AppColors.textSecondary),
                const SizedBox(width: 4),
                Text('$likes', style: AppTextStyles.caption),
                const SizedBox(width: 16),
                Icon(Icons.comment_outlined,
                    size: 16, color: AppColors.textSecondary),
                const SizedBox(width: 4),
                Text('$comments', style: AppTextStyles.caption),
                const SizedBox(width: 16),

              ],
            ),
            const Divider(height: 20, thickness: 1),
          ],
        ),
      ),
    );
  }
}
