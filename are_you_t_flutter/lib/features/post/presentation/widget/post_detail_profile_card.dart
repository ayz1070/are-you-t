import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';

class PostDetailProfileCard extends StatelessWidget {
  final String nickname;
  final String mbti;
  final String createdAt;

  const PostDetailProfileCard({
    super.key,
    required this.nickname,
    required this.mbti,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage("https://picsum.photos/200/300"),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${nickname}",
              style: AppTextStyles.body3.copyWith(fontWeight: FontWeight.bold),
            ),
            // MBTI
            Text(
              mbti,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(width: 8),
        Text(
          createdAt,
          style: AppTextStyles.body3.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
