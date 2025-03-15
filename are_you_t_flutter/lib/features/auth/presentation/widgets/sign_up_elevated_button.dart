import 'package:are_you_t_flutter/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SignUpElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SignUpElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white, //
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // ✅ 라운드 버튼 디자인 적용
        ),
        elevation: 2, // 적절한 입체감 추가
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), // ✅ 텍스트 스타일 조정
      ),
    );
  }
}