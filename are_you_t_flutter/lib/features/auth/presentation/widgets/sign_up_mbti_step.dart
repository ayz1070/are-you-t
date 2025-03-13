import 'package:flutter/material.dart';

class SignUpMbtiStep extends StatelessWidget {
  final String? selectedMbti;
  final Function(String) onMbtiSelected;

  SignUpMbtiStep({
    required this.selectedMbti,
    required this.onMbtiSelected,
    Key? key,
  }) : super(key: key);

  final List<String> _mbtiOptions = [
    'INTJ', 'INTP', 'ENTJ', 'ENTP',
    'INFJ', 'INFP', 'ENFJ', 'ENFP',
    'ISTJ', 'ISFJ', 'ESTJ', 'ESFJ',
    'ISTP', 'ISFP', 'ESTP', 'ESFP',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('MBTI 선택', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: selectedMbti,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            items: _mbtiOptions.map((mbti) {
              return DropdownMenuItem(
                value: mbti,
                child: Text(mbti),
              );
            }).toList(),
            onChanged: (value) => onMbtiSelected(value!),
          ),
        ],
      ),
    );
  }
}