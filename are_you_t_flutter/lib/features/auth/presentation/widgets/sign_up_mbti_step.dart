import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class SignUpMbtiStep extends StatefulWidget {
  final String? selectedMbti;
  final Function(String) onMbtiSelected;

  const SignUpMbtiStep({
    required this.selectedMbti,
    required this.onMbtiSelected,
    Key? key,
  }) : super(key: key);

  @override
  _SignUpMbtiStepState createState() => _SignUpMbtiStepState();
}

class _SignUpMbtiStepState extends State<SignUpMbtiStep> {
  String _selectedIorE = "I"; // 기본값
  String _selectedNorS = "N";
  String _selectedTorF = "T";
  String _selectedJorP = "J";

  // 최종 MBTI 업데이트
  void _updateMbti() {
    final newMbti = _selectedIorE + _selectedNorS + _selectedTorF + _selectedJorP;
    widget.onMbtiSelected(newMbti);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'MBTI',
            style: AppTextStyles.headline1,
          ),
          const SizedBox(height: 20),

          // "소심한가요?" → Yes: I / No: E
          _buildToggleRow("지금 침대에 누워있나요?", "I", "E", (value) {
            setState(() {
              _selectedIorE = value;
              _updateMbti();
            });
          }, _selectedIorE),

          SizedBox(height: 20),
          // "상상력이 풍부한가요?" → Yes: N / No: S
          _buildToggleRow("이 MBTI 측정 원리를 파악했나요?", "N", "S", (value) {
            setState(() {
              _selectedNorS = value;
              _updateMbti();
            });
          }, _selectedNorS),
          SizedBox(height: 20),
          // ✅ "논리적으로 판단하나요?" → Yes: T / No: F
          _buildToggleRow("본인은 T가 아니라고 생각하시나요?", "T", "F", (value) {
            setState(() {
              _selectedTorF = value;
              _updateMbti();
            });
          }, _selectedTorF),

          SizedBox(height: 20),
          // ✅ "계획적인 성향인가요?" → Yes: J / No: P
          _buildToggleRow("앞의 3개의 질문에 대한 결과를 보고 수정을 하지 않았나요?", "J", "P", (value) {
            setState(() {
              _selectedJorP = value;
              _updateMbti();
            });
          }, _selectedJorP),

          const SizedBox(height: 40),

          // ✅ 최종 MBTI 결과 표시
          Center(
            child: Text(
              "당신의 MBTI: ${_selectedIorE + _selectedNorS + _selectedTorF + _selectedJorP}",
              style: AppTextStyles.headline1.copyWith(color: AppColors.primary)
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Yes / No 질문을 포함한 Toggle 버튼을 수평 정렬
  Widget _buildToggleRow(String question, String yesValue, String noValue, Function(String) onSelected, String selectedValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // ✅ 한 줄 정렬
        children: [
          SizedBox(
            width: 180, // ✅ 질문 길이 고정 (정렬을 맞추기 위함)
            child: Text(question, style: AppTextStyles.headline3),
          ),
          Row(
            children: [
              _buildChoiceChip("네", yesValue, selectedValue, onSelected),
              const SizedBox(width: 8),
              _buildChoiceChip("아니요", noValue, selectedValue, onSelected),
            ],
          ),
        ],
      ),
    );
  }

  // ✅ Yes / No 버튼 스타일
  Widget _buildChoiceChip(String label, String value, String selectedValue, Function(String) onSelected) {
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: selectedValue == value ? Colors.white : Colors.black,
        ),
      ),
      selected: selectedValue == value,
      onSelected: (_) => onSelected(value),
      selectedColor: AppColors.primary, // ✅ 선택된 경우 파란색
      backgroundColor: Colors.grey[300], // ✅ 기본 회색
    );
  }
}