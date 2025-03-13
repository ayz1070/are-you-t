import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';

class PostProfileCard extends StatefulWidget {
  final String nickname;
  final String mbti;
  final String profileImageUrl;
  final String createdAt;

  const PostProfileCard({
    super.key,
    required this.nickname,
    required this.mbti,
    required this.profileImageUrl,
    required this.createdAt,
  });

  @override
  State<PostProfileCard> createState() => _PostProfileCardState();
}

class _PostProfileCardState extends State<PostProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(widget.profileImageUrl),
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
                  widget.nickname,
                  style: AppTextStyles.body4,
                ),
                const SizedBox(width: 6),
                Text(
                  widget.createdAt,
                  style: AppTextStyles.caption,
                ),
              ],
            ),
            Text(
              widget.mbti,
              style: AppTextStyles.body4.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
