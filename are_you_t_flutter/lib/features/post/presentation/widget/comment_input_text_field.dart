import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CommentInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;

  const CommentInputField({
    Key? key,
    required this.controller,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0), // 내부 여백
      decoration: BoxDecoration(
        color: Colors.grey[100], // 배경 회색
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // 댓글 입력 필드
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(fontSize: 12), // 텍스트 크기 축소
              decoration: const InputDecoration(
                hintText: "댓글을 입력해주세요.",
                hintStyle: TextStyle(fontSize: 12),
                border: InputBorder.none,
                isDense: true,
                // 높이 최소화
                contentPadding: EdgeInsets.zero, // 내부 여백 제거
              ),
            ),
          ),
          const SizedBox(width: 4),

          // 아이콘 버튼 (완료)
          IconButton(
            onPressed: onSubmit,
            icon: const Icon(
              Icons.send,
              size: 20,
              color: AppColors.primary,
            ),
            tooltip: "댓글 제출",
            padding: EdgeInsets.zero,
            // 버튼 여백 제거
            constraints: const BoxConstraints(), // 최소 크기로
          ),
        ],
      ),
    );
  }
}
