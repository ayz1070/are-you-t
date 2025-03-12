import 'package:are_you_t_flutter/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class PostContentTextField extends StatelessWidget {
  final TextEditingController controller;

  const PostContentTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 8,
      style: AppTextStyles.body3,
      decoration: const InputDecoration(
        hintText: '내용을 입력하세요.',
        border: InputBorder.none, // ✅ 테두리 없음
        contentPadding: EdgeInsets.symmetric(vertical: 4.0),
      ),
    );
  }
}