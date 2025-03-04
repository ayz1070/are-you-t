import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/di/auth_module.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final TextEditingController _nicknameController = TextEditingController();
  String? _selectedMbti;
  String? _profileImagePath;

  final List<String> _mbtiOptions = [
    'INTJ', 'INTP', 'ENTJ', 'ENTP',
    'INFJ', 'INFP', 'ENFJ', 'ENFP',
    'ISTJ', 'ISFJ', 'ESTJ', 'ESFJ',
    'ISTP', 'ISFP', 'ESTP', 'ESFP',
  ];

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImagePath = pickedFile.path;
      });
    }
  }

  void _signUp() async {
    final viewModel = ref.read(signUpViewModelProvider.notifier);

    if (_nicknameController.text.isEmpty || _selectedMbti == null || _profileImagePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('모든 필드를 입력해주세요!')),
      );
      return;
    }

    final success = await viewModel.signUp(
      nickname: _nicknameController.text,
      mbti: _selectedMbti!,
      profileImagePath: _profileImagePath!,
    );

    if (success) {
      Navigator.pop(context); // 회원가입 후 이전 화면으로 이동
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('회원가입에 실패했습니다. 다시 시도해주세요.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signUpViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('회원 가입')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 닉네임 입력 필드
            const Text('닉네임', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _nicknameController,
              decoration: InputDecoration(
                hintText: '닉네임을 입력하세요',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),

            // MBTI 선택 필드
            const Text('MBTI 선택', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedMbti,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              items: _mbtiOptions.map((mbti) {
                return DropdownMenuItem(
                  value: mbti,
                  child: Text(mbti),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedMbti = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // 프로필 사진 업로드
            const Text('프로필 사진 업로드', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Center(
              child: Column(
                children: [
                  _profileImagePath != null
                      ? CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(_profileImagePath!),
                  )
                      : const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.camera_alt, size: 30, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: _pickImage,
                    child: const Text('사진 선택하기'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 회원 가입 버튼
            Center(
              child: ElevatedButton(
                onPressed: state.isLoading ? null : _signUp,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: state.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('회원 가입'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}