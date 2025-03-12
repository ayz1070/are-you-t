
import 'package:are_you_t_flutter/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class PostTitleTextField extends StatelessWidget {
  final TextEditingController controller;

  const PostTitleTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppTextStyles.body2.copyWith(fontWeight: FontWeight.bold),
      decoration: const InputDecoration(
        hintText: '제목을 입력하세요.',
        border: InputBorder.none, //
        contentPadding: EdgeInsets.symmetric(vertical: 4.0),
      ),
    );
  }
}