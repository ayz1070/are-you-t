import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpProfileImageStep extends StatelessWidget {
  final String? profileImagePath;
  final Function(String) onPickImage;

  const SignUpProfileImageStep({
    required this.profileImagePath,
    required this.onPickImage,
    Key? key,
  }) : super(key: key);

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      onPickImage(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: profileImagePath != null ? FileImage(File(profileImagePath!)) : null,
          backgroundColor: Colors.grey.shade300,
        ),
        const SizedBox(height: 12),
        TextButton(
          onPressed: _pickImage,
          child: const Text('사진 선택하기'),
        ),
      ],
    );
  }
}