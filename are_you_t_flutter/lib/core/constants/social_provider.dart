// lib/core/constants/social_provider.dart

enum SocialProvider {
  google,
  kakao,
  apple, // 애플 로그인 추가 가능
}

extension SocialProviderExtension on SocialProvider {
  String get value {
    switch (this) {
      case SocialProvider.google:
        return 'google';
      case SocialProvider.kakao:
        return 'kakao';
      case SocialProvider.apple:
        return 'apple';
    }
  }

  // String to SocialProvider 변환
  static SocialProvider fromString(String value) {
    return SocialProvider.values.firstWhere(
          (e) => e.value == value,
      orElse: () => SocialProvider.google,
    );
  }
}