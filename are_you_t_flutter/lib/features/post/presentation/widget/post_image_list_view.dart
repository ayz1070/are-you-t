import 'dart:io';

import 'package:are_you_t_flutter/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostImageListView extends StatefulWidget {
  const PostImageListView({super.key});

  @override
  State<PostImageListView> createState() => _PostImageListViewState();
}

class _PostImageListViewState extends State<PostImageListView> {
  final List<File> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ✅ 아이콘 버튼 (이미지와 동일한 스타일 적용)
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), // 둥근 모서리 적용
              color : AppColors.primary, // 배경색 추가
            ),
            child: const Icon(Icons.add, size: 30, color: AppColors.white),
          ),
        ),
        const SizedBox(width: 8),

        // 추가된 이미지 리스트
        Expanded(
          child: SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _selectedImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8), // 둥근 모서리 적용
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12), // 둥근 모서리
                      ),
                      child: Image.file(
                        _selectedImages[index],
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // 갤러리에서 이미지 선택 함수
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
    }
  }
}