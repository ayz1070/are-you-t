import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecase/sign_up_with_social_account_use_case.dart';
import '../state/sign_up_state.dart';

class SignUpViewModel extends StateNotifier<SignUpState> {
  final SignUpWithSocialAccountUseCase _signUpWithSocialAccountUseCase;

  SignUpViewModel(this._signUpWithSocialAccountUseCase) : super(SignUpState());

  Future<bool> signUp({
    required String nickname,
    required String mbti,
    required String profileImagePath,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final user = await _signUpWithSocialAccountUseCase.call(
        nickname: nickname,
        mbti: mbti,
        profileImage: profileImagePath,
      );

      if (user != null) {
        state = state.copyWith(isLoading: false);
        return true; // 성공 시 true 반환
      } else {
        state = state.copyWith(isLoading: false, errorMessage: '회원가입 실패');
        return false;
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      return false;
    }
  }

  void updateNickname(String nickname) => state = state.copyWith(nickname: nickname);
  void updateMbti(String mbti) => state = state.copyWith(mbti: mbti);
  void updateProfileImageUrl(String url) => state = state.copyWith(profileImageUrl: url);
}
